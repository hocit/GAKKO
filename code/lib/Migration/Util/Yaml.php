<?php
/**
 * Migration/Util/Yaml
 *
 * @access public
 * @author LH&Creatives
 * @version 0.0.1
 */

require_once(dirname(__FILE__).'/Abstract.php');

class Migration_Util_Yaml extends Migration_Util_Abstract
{

    private $spyc = null;
    private $schemaFile;

    /**
     *  constructor
     */
    public function __construct()
    {
        parent::__construct();

        $this->spyc = $this->app->getClass('Spyc');
    }

    public function setSchemaDir($schemaDir)
    {
        $this->schemaDir = $schemaDir;
    }

    public function setStructure()
    {
        $this->structure = $this->app->getClass('Migration/Structure');

        foreach(glob($this->schemaDir.'*.yaml') as $row) {
            $file = pathinfo($row, PATHINFO_BASENAME);

            // Invalid file at Initial character '_'
            if(strpos($file, '_') === 0) {
                continue;
            }

            $this->loadSchemaFile($row);
        }

        return $this->structure;
    }

    protected function loadSchemaFile($schemaFile)
    {
        $yamlArray = spyc_load_file($schemaFile);
        
        if(! isset($yamlArray['tables'])) {
            throw new Exception('Don\'t correct schema file');
        }

        foreach($yamlArray['tables'] as $tableName => $tableData) {
            if(
                !isset($tableData['columns']) ||
                !is_array($tableData['columns'])
            ) {
                continue;
            }
            $tableClass = $this->structure->pushTable($tableName);

            // Columns
            $tableClass->pushColumns($tableData['columns']);

            // Index
            if(isset($tableData['indexes']) && is_array($tableData['indexes'])) {
                foreach($tableData['indexes'] as $index) {
                    $indexClass = $tableClass->pushIndex($index);
                    $indexClass->pushInfos($index['infos']);
                }
            }
        }
    }

}