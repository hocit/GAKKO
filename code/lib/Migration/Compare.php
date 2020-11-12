<?php
/**
 * Migration/Compare
 *
 * @access public
 * @author LH&Creatives
 * @version 0.0.1
 */

class Migration_Compare
{

    private $app;

    private $table = array(
        'add'    => array(),
        'remove' => array(),
        'update' => array(),
    );
    private $index      = array();
    private $changeFlag = false;

    public function __construct()
    {
        $this->app = FEGG_getInstance();
    }

    /**
     * Push Add Table Compare
     *
     * @param Migration_Structure_Table $addTable
     */
    public function pushAddTable($addTable)
    {
        $this->changeFlag = true;
        $this->table['add'] = $addTable;
    }

    /**
     * Push Remove Table Compare
     *
     * @param Migration_Structure_Table $removeTable
     */
    public function pushRemoveTable($removeTable)
    {
        $this->changeFlag = true;
        $this->table['remove'] = $removeTable;
    }

    /**
     * Push Update Column Compare
     *
     * @param Migration_Structure_Table $updateTable
     * @param Migration_Structure_Table $targetTable
     */
    public function pushUpdateTable($updateTable, $targetTable)
    {
        $this->changeFlag = true;
        $this->table['update'][] = array(
            'from' => $targetTable,
            'to'   => $updateTable,
        );
    }

    /**
     * Initalize Index compare
     *
     * @param string $tableName
     */
    public function initIndex($tableName)
    {
        $this->changeFlag = true;
        $this->index[$tableName] = array(
            'add'    => array(),
            'remove' => array(),
            'update' => array(),
        );
    }

    /**
     * Push Add Index Compare
     *
     * @param string $tableName
     * @param Migration_Structure_Index $addIndex
     */
    public function pushAddIndex($tableName, $addIndex)
    {
        if(! isset($this->index[$tableName])) {
            $this->initIndex($tableName);
        }
        $this->index[$tableName]['add'] = $addIndex;
    }

    /**
     * Push Remove Index Compare
     *
     * @param string $tableName
     * @param Migration_Structure_Index $removeIndex
     */
    public function pushRemoveIndex($tableName, $removeIndex)
    {
        if(! isset($this->index[$tableName])) {
            $this->initIndex($tableName);
        }
        $this->index[$tableName]['remove'] = $removeIndex;
    }

    /**
     * Push Update Index Compare
     *
     * @param string $tableName
     * @param Migration_Structure_Index $removeIndex
     */
    public function pushUpdateIndex($tableName, $updateIndex)
    {
        if(! isset($this->index[$tableName])) {
            $this->initIndex($tableName);
        }
        $this->index[$tableName]['update'] = $updateIndex;
    }

    /**
     * Is Exists Compare
     *
     * @return boolean
     */
    public function isChange()
    {
        return $this->changeFlag;
    }

    /**
     * Execute Compare Data to DB
     */
    protected $db;
    public function execute()
    {
        $this->db = $this->app->getClass('DB_pdo');

        // Table
        foreach($this->table['add'] as $table) {
            $this->executeAddTable($table);
        }
        foreach($this->table['remove'] as $table) {
            $this->executeRemoveTable($table);
        }
        foreach($this->table['update'] as $table) {
            $this->executeUpdateTable($table['from'], $table['to']);
        }

        // Index
        foreach($this->index as $tableName => $indexes) {
            foreach($indexes['add'] as $addIndex) {
                $this->executeAddIndex($tableName, $addIndex);
            }
            foreach($indexes['remove'] as $removeIndex) {
                $this->executeRemoveIndex($removeIndex);
            }
            foreach($indexes['update'] as $updateIndex) {
                $this->executeUpdateIndex($tableName, $updateIndex);
            }
        }
    }

    /**
     * Execute Add Table
     *
     * @param Migration_Structure_Table $table
     */
    protected function executeAddTable($table)
    {
        $tableName = $table->getName();

        $field = array();
        foreach($table->getColumns() as $clm) {
            $field[] = $clm->toArray();
        }

        $index = array();
        foreach($table->getIndexes() as $idx) {
            $row = $idx->toArray();
            $targets = array();
            foreach($row['infos'] as $info) {
                $targets[] = $info['name'];
            }
            $row['target'] = implode(',', $targets);
            unset($row['infos']);

            $index[] = $row;
        }

        $this->db->createTable($tableName, $field)->execute();
        foreach($index as $idx) {
            $this->db->createIndex($tableName, $idx)->execute();
        }

        if($table->getAutoIncrement()) {
            $this->db->unsetRegularUseQuery();
            $this->db
                ->setItem('name, seq', array('name' => $tableName, 'seq' => 0))
                ->insert('sqlite_sequence')->execute();
        }
    }

    /**
     * Execute Remove Table
     *
     * @param Migration_Structure_Table $table
     */
    protected function executeRemoveTable($table)
    {
        $this->db->dropTable($table->getName())->execute();
    }

    /**
     * Execute Update Table
     *
     * @param Migration_Structure_Table $fromTable
     * @param Migration_Structure_Table $toTable
     */
    protected function executeUpdateTable($fromTable, $toTable)
    {
        // Compare Column list
        $fromColumn = array();
        $fromColumnClass = $fromTable->getColumns();
        foreach($fromColumnClass as $clm) {
            $fromColumn[] = $clm->name;
        }

        $toColumn = array();
        $toColumnClass = $toTable->getColumns();
        foreach($toColumnClass as $clm) {
            $toColumn[] = $clm->name;
        }

        // Intersect Columns
        $intersect = array_intersect($fromColumn, $toColumn);
        $intersectQuery = implode(', ', $intersect);

        // Temporary Table name
        $tableName = $toTable->getName();
        $tmpName   = $fromTable->getName() . '_fg_rpl_tmp';

        // Rename Table
        $this->db->alterRenameTo($tableName, $tmpName)->execute();

        // Create New Table
        $field = array();
        foreach($toTable->getColumns() as $clm) {
            $field[] = $clm->toArray();
        }
        $this->db->createTable($tableName, $field)->execute();

        // Drop Temp Table Index
        // And Re-create index
        $index = array();
        foreach($fromTable->getIndexes() as $idx) {
            $this->db->dropIndex($idx->name)->execute();

            $row = $idx->toArray();
            $targets = array();
            foreach($row['infos'] as $info) {
                $targets[] = $info['name'];
            }
            $row['target'] = implode(',', $targets);
            unset($row['infos']);

            $index[] = $row;
        }
        foreach($index as $idx) {
            $this->db->createIndex($tableName, $idx)->execute();
        }

        // Copy Parameter
        $sql = 'INSERT INTO "'.$tableName.'" ('.$intersectQuery.') SELECT '.$intersectQuery.' FROM '.$tmpName;
        $this->db->setQuery($sql)->execute();

        // Drop Table
        $this->db->dropTable($tmpName)->execute();
    }

    /**
     * Index
     */
    public function executeAddIndex($tableName, $addIndex)
    {
        $index = $addIndex->toArray();
        $targets = array();
        foreach($index['infos'] as $info) {
            $targets[] = $info['name'];
        }
        $index['target'] = implode(',', $targets);
        unset($index['infos']);

        $this->db->createIndex($tableName, $index)->execute();
    }

    public function executeRemoveIndex($removeIndex)
    {
        $this->db->dropIndex($removeIndex->name)->execute();
    }

    public function executeUpdateIndex($tableName, $updateIndex)
    {
        $this->executeRemoveIndex($updateIndex);
        $this->executeAddIndex($tableName, $updateIndex);
    }

    /**
     * Convert to Array
     */
    public function toArray()
    {
        $resultArray = array(
            'table' => array(
                'add'    => array(),
                'remove' => array(),
            ),
            'column' => array(),
            'index'  => array(),
            'changeFlag' => $this->isChange(),
        );

        // Table
        foreach($this->table['add'] as $addTable) {
            $resultArray['table']['add'][] = $addTable->toArray();
        }
        foreach($this->table['remove'] as $removeTable) {
            $resultArray['table']['remove'][] = $removeTable->toArray();
        }
        foreach($this->table['update'] as $updateTable) {
            $resultArray['table']['update'][] = array(
                'from' => $updateTable['from']->toArray(),
                'to'   => $updateTable['to']->toArray(),
            );
        }

        // Index
        foreach($this->index as $table => $tableIndex) {
            $resultArray['index'][$table] = array(
                'add'    => array(),
                'remove' => array(),
                'update' => array(),
            );

            foreach($tableIndex['add'] as $addIndex) {
                $resultArray['index'][$table]['add'][] = $addIndex->toArray();
            }
            foreach($tableIndex['remove'] as $removeIndex) {
                $resultArray['index'][$table]['remove'][] = $removeIndex->toArray();
            }
            foreach($tableIndex['update'] as $updateIndex) {
                $resultArray['index'][$table]['update'][] = $updateIndex->toArray();
            }
        }

        return $resultArray;
    }
}