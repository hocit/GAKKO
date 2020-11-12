<?php
/**
 * Migration/Util/Database
 *
 * @access public
 * @author LH&Creatives
 * @version 0.0.1
 */

require_once(dirname(__FILE__).'/Abstract.php');

class Migration_Util_Database extends Migration_Util_Abstract
{

    private $model_master;
    private $model_seq;

    public function __construct()
    {
        parent::__construct();

        $this->model_master = new Model(false, array(
            'table' => 'sqlite_master',
        ));
        $this->model_master->disabledRegularUseQuery();

        $this->model_seq = new Model(false, array(
            'table' => 'sqlite_sequence',
        ));
        $this->model_seq->disabledRegularUseQuery();
    }

    public function setStructure()
    {
        $this->structure = $this->app->getClass('Migration/Structure');

        // Get Database List
        $tables =
            $this->model_master
                ->select('name')
                ->where('type = ?', 'table')
                ->where('name != ?', 'sqlite_sequence')
                ->listMax(9999)
                ->find();
        
        // Is Autoincrement?
        $isRootAI =
            $this->model_master
                ->where('type = ?', 'table')
                ->where('name = ?', 'sqlite_sequence')
                ->listMax(9999)
                ->count();
        
        foreach($tables as $table) {
            $tableName = $table['name'];
            $tableClass = $this->structure->pushTable($tableName);

            // Get Column List
            $columns = $this->model_master->pragma($tableName, 'table');
            $tableClass->pushColumns($columns);

            // Check Autoincrement
            if($isRootAI) {
                $isAI = $this->model_seq->where('name = ?', $tableName)->count();
                $tableClass->setAutoIncrementWithColumn($isAI);
            }

            // Get Index List
            $indexes = $this->model_master->pragma($tableName, 'index_list');
            foreach($indexes as $index) {
                // Don't use "autoindex"
                if(strpos($index['name'], 'sqlite_autoindex_') !== false) {
                    continue;
                }

                $indexClass = $tableClass->pushIndex($index);
                $infos = $this->model_master->pragma($indexClass->name, 'index');
                $indexClass->pushInfos($infos);
            }
        }

        return $this->structure;
    }

    public function createYaml($filePath)
    {
        $spyc = $this->app->getClass('Spyc');

        $structure = $this->getStructure();
        $yamlStr = spyc_dump($structure->toArray());

        file_put_contents($filePath, $yamlStr);
    }

}