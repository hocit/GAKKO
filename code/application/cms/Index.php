<?php // code/application/cms/Index.php

class Index extends MyApplication
{
    private $_common;

    /**
     * コンストラクタ
     */
    public function __construct()
    {
        parent::__construct();
    }


    /**
     * イニシャライズ
     *
     * 省略可。定義されているときは __construct() の後で呼び出される。
     * __construct() との違いは自身のインスタンスが生成されているので
     * $thisにより、Applicationクラスのメソッドが使用できる。
     */
    public function __init()
    {
        parent::__init();

        $this->setSiteinfo( 'title', 'Webサイト管理システム' );
        // LH用汎用クラスを読込
        $this->_lh = $this->getClass( 'LH_FW' );

        // 認証不可ならログイン画面へ
        if(! $this->_lh->isAuth() ) {
            $this->_lh->goLogin();
            exit();
        }

        $this->page['prefix'] = $this->_lh->getPrefix();
    }


    public function index()
    {
        $this->displayPage( $this->page['prefix'].'index' );
    }

}
/* End Of File: code/application/cms/Index.php */