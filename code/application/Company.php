<?php // code/application/Index.php

class Company extends MyApplication
{
    private $_common;

    /**
     * コンストラクタ
     * Constructor
     */
    public function __construct()
    {
        parent::__construct();
    }


    /**
     * イニシャライズ
     * Initialize progress
     *
     * 省略可。定義されているときは __construct() の後で呼び出される。
     * __construct() との違いは自身のインスタンスが生成されているので
     * $thisにより、Applicationクラスのメソッドが使用できる。
     *
     * This method run after making self instance.
     * So, it can use Application class method, for example "$this->in()".
     * It is the difference between __init and construct.
     * If this method is nothing, initializing progress is omitted.
     */
    public function __init()
    {
        parent::__init();

        // LH用汎用クラスを読込
        // Load general class for LH Fegg
        $this->_lh    = $this->getClass('LH_FW');

        // モデルクラスを指定
        // Setup model class
        $this->_model = new Model(false, array(
            'table'   => 'cms_news',
            'id'      => 'news_id',
            'visible' => 'visible',
        ));
        $this->page['id'] = $this->_model->getPrimary();
    }


    public function index()
    {
        // 処理
        $this->displayPage('company/index');
    }
}
/* End Of File: code/application/Index.php */
