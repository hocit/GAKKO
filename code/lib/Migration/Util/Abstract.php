<?php
/**
 * Migration/Util/Abstract
 *
 * @access public
 * @author LH&Creatives
 * @version 0.0.1
 */

class Migration_Util_Abstract
{

    protected $app;
    protected $structure;

    public function __construct()
    {
        $this->app = FEGG_getInstance();
    }

    public function setStructure()
    {
        $this->structure = $this->app->getClass('Migration/Structure');

        return $this->structure;
    }

    public function getStructure()
    {
        if(! isset($this->structure)) {
            $this->setStructure();
        }

        return $this->structure;
    }

}