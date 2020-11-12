<?php
/**
 * Migration/Structure
 *
 * @access public
 * @author LH&Creatives
 * @version 0.0.1
 */

class Migration_Structure
{

    private $app;
    private $tables = array();

    public function __construct()
    {
        $this->app = FEGG_getInstance();
    }

    /**
     * Push Table info
     *
     * @param string $table
     * @return Migration_Structure_Table
     */
    public function pushTable($table)
    {
        $tblClass = new Migration_Structure_Table($table);
        $this->tables[] = $tblClass;

        return $tblClass;
    }

    /**
     * Push Multiple Table info
     *
     * @param mixed $tables
     * @return Migration_Structure
     */
    public function pushTables($tables) {
        foreach($tables as $table) {
            $this->pushTable($table);
        }

        return $this;
    }

    /**
     * Get Table Info
     *
     * @return array
     */
    public function getTables()
    {
        return $this->tables;
    }

    /**
     * Convert to array
     *
     * @return array
     */
    public function toArray()
    {
        $resultArray = array(
            'tables' => array(),
        );

        foreach($this->getTables() as $tableClass) {
            $tableName = $tableClass->getName();
            $resultArray['tables'][$tableName] = $tableClass->toArray();
        }

        return $resultArray;
    }

    /**
     * Compare another Structure
     *
     * @param Migration_Structure $targetStructure
     * @return Migration_Compare
     */
    public function compare($targetStructure)
    {
        $resultCompare = $this->app->getClass('Migration/Compare');

        $tables = $this->getTables();
        $targetTables = $targetStructure->getTables();

        // Compare Table
        list($addTable, $removeTable) = $this->compareTable($tables, $targetTables);
        if(count($addTable)) {
            $resultCompare->pushAddTable($addTable);
        }
        if(count($removeTable)) {
            $resultCompare->pushRemoveTable($removeTable);
        }

        // Search Update Table
        foreach($tables as $table) {
            $name = $table->getName();
            foreach($targetTables as $targetTable) {
                $targetName = $targetTable->getName();
                if($name === $targetName) {
                    break;
                }
            }

            // Column
            $columns       = $table->getColumns();
            $targetColumns = $targetTable->getColumns();

            // Compare Column Name
            list($addColumn, $removeColumn) =
                $this->compareColumnName($columns, $targetColumns);
            $updateColumn = $this->compareColumn($columns, $targetColumns);

            if(
                count($addColumn) ||
                count($removeColumn) ||
                count($updateColumn)
            ) {
                $resultCompare->pushUpdateTable($table, $targetTable);
            }

            // Index
            $indexes       = $table->getIndexes();
            $targetIndexes = $targetTable->getIndexes();

            // Compare Index Name
            list($addIndex, $removeIndex) =
                $this->compareIndexName($indexes, $targetIndexes);
            $updateIndex = $this->compareIndex($indexes, $targetIndexes);

            if(count($addIndex)) {
                $resultCompare->pushAddIndex($name, $addIndex);
            }
            if(count($removeIndex)) {
                $resultCompare->pushRemoveIndex($name, $removeIndex);
            }
            if(count($updateIndex)) {
                $resultCompare->pushUpdateIndex($name, $updateIndex);
            }
        }

        return $resultCompare;
    }

    /**
     * Compare Tables
     *
     * @param array $tables
     * @param array $targetTables
     * @return array
     */
    protected function compareTable(&$tables, &$targetTables)
    {
        $addArray    = array();
        $removeArray = array();

        foreach($tables as $i => $table) {
            $isAdd = true;
            foreach($targetTables as $j => $targetTable) {
                if($table->compare($targetTable)) {
                    $isAdd = false;
                    break;
                }
            }

            if($isAdd) {
                $addArray[] = $table;
                unset($tables[$i]);
            }
        }

        foreach($targetTables as $j => $targetTable) {
            $isRemove = true;
            foreach($tables as $i => $table) {
                if($targetTable->compare($table)) {
                    $isRemove = false;
                    break;
                }
            }

            if($isRemove) {
                $removeArray[] = $targetTable;
                unset($targetTables[$j]);
            }
        }

        return array($addArray, $removeArray);
    }

    /**
     * Compare Columns Name
     *
     * @param array $columns
     * @param array $targetColumns
     * @return array
     */
    protected function compareColumnName(&$columns, &$targetColumns)
    {
        $addArray    = array();
        $removeArray = array();

        foreach($columns as $i => $column) {
            $isAdd = true;
            foreach($targetColumns as $j => $targetColumn) {
                if($column->name === $targetColumn->name) {
                    $isAdd = false;
                    break;
                }
            }


            if($isAdd) {
                $addArray[] = $column;
                unset($columns[$i]);
            }
        }

        foreach($targetColumns as $j => $targetColumn) {
            $isRemove = true;
            foreach($columns as $i => $column) {
                if($targetColumn->name === $column->name) {
                    $isRemove = false;
                    break;
                }
            }

            if($isRemove) {
                $removeArray[] = $targetColumn;
                unset($targetColumns[$j]);
            }
        }

        return array($addArray, $removeArray);
    }

    /**
     * Compare Columns
     *
     * @param array $columns
     * @param array $targetColumns
     * @return array
     */
    protected function compareColumn($columns, $targetColumns)
    {
        $updateArray = array();

        foreach($columns as $i => $column) {
            foreach($targetColumns as $j => $targetColumn) {
                if($column->name === $targetColumn->name) {
                    break;
                }
            }

            if(! $column->compare($targetColumn)) {
                $updateArray[] = $column;
            }
        }

        return $updateArray;
    }

    /**
     * Compare Indexes Name
     *
     * @param array $indexes
     * @param array $targetIndexes
     * @return array
     */
    protected function compareIndexName(&$indexes, &$targetIndexes)
    {
        $addArray    = array();
        $removeArray = array();

        foreach($indexes as $i => $index) {
            $isAdd = true;
            foreach($targetIndexes as $j => $targetIndex) {
                if($index->name === $targetIndex->name) {
                    $isAdd = false;
                    break;
                }
            }


            if($isAdd) {
                $addArray[] = $index;
                unset($indexes[$i]);
            }
        }

        foreach($targetIndexes as $j => $targetIndex) {
            $isRemove = true;
            foreach($indexes as $i => $index) {
                if($targetIndex->name === $index->name) {
                    $isRemove = false;
                    break;
                }
            }

            if($isRemove) {
                $removeArray[] = $targetIndex;
                unset($targetIndexes[$j]);
            }
        }

        return array($addArray, $removeArray);
    }

    /**
     * Compare Indexes
     *
     * @param array $indexes
     * @param array $targetIndexes
     * @return array
     */
    protected function compareIndex($indexes, $targetIndexes)
    {
        $updateArray = array();

        foreach($indexes as $i => $index) {
            foreach($targetIndexes as $j => $targetIndex) {
                if($index->name === $targetIndex->name) {
                    break;
                }
            }

            if(! $index->compare($targetIndex)) {
                $updateArray[] = $index;
            }
        }

        return $updateArray;
    }
}

/**
 * Migration/Structure/Table
 *
 * @access public
 * @author LH&Creatives
 * @version 0.0.1
 */
class Migration_Structure_Table
{

    private $name;
    private $columns = array();
    private $indexes = array();
    private $autoincrement = false;

    public function __construct($name)
    {
        $this->name = $name;
    }

    /**
     * Get Table Name
     *
     * @return string
     */
    public function getName()
    {
        return $this->name;
    }

    /**
     * Push Column info
     *
     * @param array $column
     * @return Migration_Structure_Column
     */
    public function pushColumn($column)
    {
        $columnClass = new Migration_Structure_Column($this, $column);
        $this->columns[] = $columnClass;

        return $columnClass;
    }

    /**
     * Push Multiple Column info
     *
     * @param mixed $columns
     * @return Migration_Structure_Table
     */
    public function pushColumns($columns)
    {
        foreach($columns as $column) {
            $this->pushColumn($column);
        }

        return $this;
    }

    /**
     * Get Columun infos
     *
     * @return array
     */
    public function getColumns()
    {
        return $this->columns;
    }

    /**
     * Push Index info
     *
     * @param array $column
     * @return Migration_Structure_Index
     */
    public function pushIndex($index)
    {
        $indexClass = new Migration_Structure_Index($this, $index);
        $this->indexes[] = $indexClass;

        return $indexClass;
    }

    /**
     * Push Multiple Index info
     *
     * @param mixed $columns
     * @return Migration_Structure_Table
     */
    public function pushIndexes($indexes)
    {
        foreach($indexes as $index) {
            $this->pushIndex($index);
        }
        return $this;
    }

    /**
     * Get Index infos
     *
     * @return array
     */
    public function getIndexes()
    {
        return $this->indexes;
    }

    /**
     * Set Autoincrement Flag
     */
    public function setAutoIncrement($flag)
    {
        $this->autoincrement = (bool)$flag;
    }

    public function setAutoIncrementWithColumn($flag)
    {
        $this->setAutoIncrement($flag);

        foreach($this->columns as $key => $column) {
            if($this->autoincrement && $column->pk) {
                $column->ai = 1;
            } else {
                $column->ai = 0;
            }
        }
    }

    public function getAutoIncrement()
    {
        return $this->autoincrement;
    }

    /**
     * Convert to array
     *
     * @return array
     */
    public function toArray()
    {
        $resultArray = array(
            'name'    => $this->getName(),
            'columns' => array(),
            'indexes' => array(),
        );

        // Columns
        foreach($this->getColumns() as $columnClass) {
            $resultArray['columns'][] = $columnClass->toArray();
        }

        // Indexes
        foreach($this->getIndexes() as $indexClass) {
            $resultArray['indexes'][] = $indexClass->toArray();
        }

        return $resultArray;
    }

    /**
     * Compare another Table Structure
     *
     * @param Migration_Structure_Table
     * @return boolean
     */
    public function compare($targetTableClass)
    {
        return $this->getName() === $targetTableClass->getName();
    }
}

/**
 * Migration/Structure/Column
 *
 * @access public
 * @author LH&Creatives
 * @version 0.0.1
 */
class Migration_Structure_Column
{
    private $parent;
    // private $_cid;
    private $_name;
    private $_type;
    private $_notnull = 0;
    private $_dflt_value = null;
    private $_pk = 0;
    private $_ai = 0;

    public function __construct($parent, $column)
    {
        $this->parent = $parent;

        foreach($column as $key => $value) {
            $this->$key = $value;
        }
    }

    /**
     * Get parent Class
     *
     * @return Migration_Structure_Table
     */
    public function getParent()
    {
        $this->parent;
    }

    public function __set($name, $value)
    {
        $key = '_'.$name;
        if(property_exists($this, $key)) {
            switch($name) {
                case 'notnull':
                case 'pk':
                    $this->$key = (int)$value;
                    break;
                case 'ai':
                    $value = (int)$value;
                    $this->$key = $value;
                    if((bool)$value) {
                        $this->parent->setAutoIncrement((bool)$value);
                    }
                    break;
                default:
                    $this->$key = $value;
                    break;
            }
        }
    }

    public function __get($name)
    {
        $key = '_'.$name;
        if(property_exists($this, $key)) {
            return $this->$key;
        }

        if(property_exists($this, $name)) {
            return $this->$name;
        }

        throw new Exception('Not found property : ' . $name);
    }

    /**
     * Convert to array
     *
     * @return array
     */
    public function toArray()
    {
        $resultArray = array(
            // 'cid'        => (int)$this->_cid,
            'name'       => $this->_name,
            'type'       => $this->_type,
            'notnull'    => (int)$this->_notnull,
            'dflt_value' => $this->_dflt_value,
            'pk'         => (int)$this->_pk,
            'ai'         => (int)$this->_ai,
        );

        return $resultArray;
    }

    /**
     * Compare another Column Structure
     *
     * @param Migration_Structure_Column
     * @return boolean
     */
    public function compare($targetColumn)
    {
        return (
            $this->name       === $targetColumn->name &&
            $this->type       === $targetColumn->type &&
            $this->notnull    === $targetColumn->notnull &&
            $this->dflt_value === $targetColumn->dflt_value &&
            $this->pk         === $targetColumn->pk &&
            $this->ai         === $targetColumn->ai
        );
    }
}

/**
 * Migration/Structure/Index
 *
 * @access public
 * @author LH&Creatives
 * @version 0.0.1
 */
class Migration_Structure_Index
{
    private $parent;
    // private $_seq;
    private $_name;
    private $_unique = 0;
    // private $_origin;
    // private $_partial;

    private $infos = array();

    public function __construct($parent, $index)
    {
        $this->parent = $parent;

        foreach($index as $key => $value) {
            if($key === 'infos') {
                continue;
            }

            $this->$key = $value;
        }
    }

    /**
     * Get parent Class
     *
     * @return Migration_Structure_Table
     */
    public function getParent()
    {
        $this->parent;
    }

    public function __set($name, $value)
    {
        $key = '_'.$name;
        if(property_exists($this, $key)) {
            switch($name) {
                case 'unique':
                // case 'partial':
                    $this->$key = (int)$value;
                    break;
                default:
                    $this->$key = $value;
                    break;
            }
        }
    }

    public function __get($name)
    {
        $key = '_'.$name;
        if(property_exists($this, $key)) {
            return $this->$key;
        }

        if(property_exists($this, $name)) {
            return $this->$name;
        }

        throw new Exception('Not found property : ' . $name);
    }

    /**
     * Push Index info
     *
     * @param array $info
     * @return Migration_Structure_Index_Info
     */
    public function pushInfo($info)
    {
        $infoClass = new Migration_Structure_Index_Info($this, $info);
        $this->infos[] = $infoClass;

        return $infoClass;
    }

    /**
     * Push Multiple Index info
     *
     * @param mixed $columns
     * @return Migration_Structure_Index
     */
    public function pushInfos($infos)
    {
        foreach($infos as $info) {
            $this->pushInfo($info);
        }

        return $this;
    }

    /**
     * Get Index infos
     *
     * @return array
     */
    public function getInfos()
    {
        return $this->infos;
    }

    /**
     * Convert to array
     *
     * @return array
     */
    public function toArray()
    {
        $resultArray = array(
            // 'seq'     => (int)$this->_seq,
            'name'    => $this->_name,
            'unique'  => (int)$this->_unique,
            // 'origin'  => $this->_origin,
            // 'partial' => (int)$this->_partial,
            'infos'   => array(),
        );

        foreach($this->getInfos() as $info) {
            $resultArray['infos'][] = $info->toArray();
        }

        return $resultArray;
    }

    /**
     * Compare another Index Structure
     *
     * @param Migration_Structure_Index
     * @return boolean
     */
    public function compare($targetIndex)
    {
        $isInfoEqual = true;
        $infos       = $this->getInfos();
        $targetInfos = $targetIndex->getInfos();

        foreach($infos as $i => $info) {
            if(! isset($targetInfos[$i])) {
                $isInfoEqual = false;
                break;
            }

            if(! $info->compare($targetInfos[$i])) {
                $isInfoEqual = false;
                break;
            }
        }

        return (
            $this->name    === $targetIndex->name &&
            $this->unique  === $targetIndex->unique &&
            // $this->origin  === $targetIndex->origin &&
            // $this->partial === $targetIndex->partial &&
            $isInfoEqual
        );
    }
}

/**
 * Migration/Structure/Index/Info
 *
 * @access public
 * @author LH&Creatives
 * @version 0.0.1
 */
class Migration_Structure_Index_Info
{
    private $parent;
    // private $_seqno;
    // private $_cid;
    private $_name;

    public function __construct($parent, $info)
    {
        $this->parent = $parent;

        foreach($info as $key => $value) {
            $this->$key = $value;
        }
    }

    /**
     * Get parent Class
     *
     * @return Migration_Structure_Index
     */
    public function getParent()
    {
        $this->parent;
    }

    public function __set($name, $value)
    {
        $key = '_'.$name;
        if(property_exists($this, $key)) {
            switch($name) {
                default:
                    $this->$key = $value;
                    break;
            }
        }
    }

    public function __get($name)
    {
        $key = '_'.$name;
        if(property_exists($this, $key)) {
            return $this->$key;
        }

        if(property_exists($this, $name)) {
            return $this->$name;
        }

        throw new Exception('Not found property : ' . $name);
    }

    /**
     * Convert to array
     *
     * @return array
     */
    public function toArray()
    {
        $resultArray = array(
            // 'seqno' => (int)$this->_seqno,
            // 'cid'   => (int)$this->_cid,
            'name'  => $this->_name,
        );

        return $resultArray;
    }

    /**
     * Compare another Index Info Structure
     *
     * @param Migration_Structure_Index_Info
     * @return boolean
     */
    public function compare($targetInfo)
    {
        return (
            $this->name === $targetInfo->name
        );
    }
}
