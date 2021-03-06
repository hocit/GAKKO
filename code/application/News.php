<?php // code/application/admin/News.php

class News extends MyApplication
{
    private $_common = array();

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
        $this->_lh = $this->getClass( 'LH_FW', 'news' );

        // モデルクラスを指定
        // Setup model class
        $this->_model = new Model(false, array(
            'table'   => 'cms_news',
            'id'      => 'news_id',
            'visible' => 'visible',
        ));
        $this->page['id'] = $this->_model->getPrimary();
    }


    /**
     * データ取得
     *
     * @param string $internalId 代入したら一件取得 / If assigned, get one row data
     */
    private function _setData( $internalId = '' )
    {
        if( $internalId ) {
            // データ取得
            // Get data
            $this->page['data'] = $this->_model->id( $internalId );
        } else {
            // 件数設定
            // Assignment row count
            $listMax = 20;

            // データ取得
            // Get data
            $this->page['data'] =
                $this->_model
                    ->listMax($listMax)
                    ->current($this->in('p'))
                    ->order('post_date', 'desc')
                    ->order('news_id', 'desc')
                    ->find();

            // ページャーのデータを取得
            // Get pager data
            $this->page['pager'] = $this->_model->getPager();
        }
    }


    /**
     * 一覧ページ
     * List page
     */
    public function index()
    {
        $this->_setData();

        $this->displayPage( 'news/lists' );
    }


    /**
     * 詳細ページ
     * Detail page
     */
    public function detail( $id )
    {
        $this->_setData( $id );

        if(! $this->page['data'] ) {
            $this->redirect( 'news' );
        }

        $this->displayPage( 'news/detail' );
    }

}
/* End Of File: code/application/admin/News.php */