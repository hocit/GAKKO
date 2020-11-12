<?php // code/application/cms/News.php

class News extends MyApplication
{
    private $_common = array();

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
        $this->_lh = $this->getClass( 'LH_FW', 'news' );

        // 認証不可ならログイン画面へ
        if(! $this->_lh->isAuth() ) {
            $this->_lh->goLogin();
            exit();
        }

        // モデルクラスを指定
        $this->_model = new Model(true, array(
            'table'   => 'cms_news',
            'id'      => 'news_id',
            'visible' => 'visible',
            'bind'    => array(
                'news_id'   => 'INTEGER',
                'image_id'  => 'INTEGER',
                'file_id'   => 'INTEGER',
                'post_date' => 'DATETIME',
            )
        ));

        // 汎用変数設定
        $this->page['mode_title'] = 'ニュース';
        $this->page['this_id']    = $this->_model->getPrimary();
        $this->page['prefix']     = $this->_lh->getPrefix();
        $this->page['prev_num']   = $this->_lh->getBackPage();
    }


    /**
     * データ取得
     *
     * @param string $internalId 代入したら一件取得
     */
    private function _setData( $internalId = '' )
    {
        if( $internalId ) {
            $this->page['internal_id'] = $internalId;
            $this->setHidden('internal_id', $internalId);

            // データ取得
            $this->page['data'] = $this->_model->id( $internalId );
        } else {
            // 件数設定
            $listMax = 40;

            // データ取得
            $this->_model
                ->listMax($listMax)
                ->current($this->in('p'))
                ->order('post_date', 'desc')
                ->order('news_id', 'desc');

            if($this->in('category')) {
                $this->_model
                    ->where('category = ?', $this->in('category'));
            }
            if($this->in('s')) {
                $searchWord = '%'.$this->in('s').'%';
                $this->_model
                    ->where('title LIKE ?', $searchWord);
            }

            $this->page['data'] =
                $this->_model
                    ->find();

            // ページャーのデータを取得
            $this->page['pager'] = $this->_model->getPager();
        }
    }

    /**
     * エラーチェック
     *
     * @return mixed $errorMessage
     */
    private function _validatePostedData()
    {
        $validation = $this->getClass('Validation');

        $name = '投稿日';
        $id = 'post_date';
        $validation->required( $id, $this->in( $id ), array( '@required',  $name ) );

        $name = 'タイトル';
        $id = 'title';
        $validation->required( $id, $this->in( $id ), array( '@required',  $name ) );

        $name = 'カテゴリー';
        $id = 'category';
        $validation->required( $id, $this->in( $id ), array( '@required',  $name ) );

        // 正当性確認
        return $validation->getErrorMessage();
    }


    /**
     * 一覧
     */
    public function index( $message = NULL )
    {
        $this->_setData();

        /** 一覧に戻るアドレス */
        $this->_lh->setBackPage( $this->in( 'p' ) );
        $this->page['_mode'] = 'list';

        if( $message )
            $this->page['message'] = $this->_lh->getMessage( $message );

        $this->displayPage( $this->page['prefix'].'/lists' );
    }

    /**
     * 新規追加
     *
     * @param string  $mode
     * @param integer $internalId
     */
    public function add( $mode = NULL, $internalId = NULL )
    {
        $this->page['mode'] = '新規追加';
        $this->page['_mode'] = 'add';

        /** 一覧に戻るアドレス */
        $this->page['prev_link'] = $this->_lh->getBackLink( 'index' );

        if( $mode === 'copy' && $internalId ) {
            $this->_setData( $internalId );
            unset( $this->page['internal_id'] );
            $this->unsetHidden( 'internal_id' );
        } else {
            // デフォルト値
            $this->page['data']['visible']   = TRUE;
            $this->page['data']['post_date'] = date( 'Y/m/d' );
        }

        $this->displayPage( $this->page['prefix'].'/form' );
    }

    /**
     * 編集
     *
     * @param integer $internalId
     */
    public function edit( $internalId, $message = NULL )
    {
        $this->page['mode'] = '編集';
        $this->page['_mode'] = 'list';

        /** 一覧に戻るアドレス */
        $this->page['prev_link'] = $this->_lh->getBackLink( 'index' );

        $this->_setData($internalId);

        if( $message )
            $this->page['message'] = $this->_lh->getMessage( $message );

        $this->displayPage( $this->page['prefix'].'/form' );
    }

    /**
     * 削除
     *
     * @param integer $internalId
     */
    public function delete( $internalId )
    {
        // 削除
        $this->_model->delete( $internalId );
        $message = 'DELETED';

        // 画面遷移
        $this->redirect( $this->_lh->getBackPath( 'index/'.$message ) );
    }

    /**
     * データ反映
     */
    public function update()
    {
        // エラーチェック
        $errorMessage = $this->_validatePostedData();

        if (!$errorMessage) {
            // データ更新
            $data = $this->in();
            $item = 'title, visible, category, content, image_id, file_id, post_date';

            if (!$this->in('internal_id')) {
                // 新規登録
                $internalId = $this->_model->insert( $item, $data );
                $message = 'ADDED';
            } else {
                // 更新
                $internalId = $this->in('internal_id');
                $this->_model->update( $item, $data, $internalId );
                $message = 'EDITED';
            }

            // 画面遷移
            $this->redirect( $this->page['prefix'].'/edit/'.$internalId.'/'.$message );
        } else {
            // Postデータを統合
            if ($this->in('internal_id')) {
                $this->page['mode'] = '編集';
                $this->_setData( $this->in( 'internal_id' ) );
                $this->page['data'] = array_merge( $this->page['data'], $this->in( '', 'post' ) );
            } else {
                $this->page['mode'] = '新規追加';
                $this->page['data'] = $this->in( '', 'post' );
            }

            /** 一覧に戻るアドレス */
            $this->page['prev_link'] = $this->_lh->getBackLink( 'index' );

            // エラーメッセージ設定
            $this->page['error'] = $errorMessage;

            // 編集画面表示
            $this->displayPage( $this->page['prefix'].'/form' );
        }
    }

}
/* End Of File: code/application/cms/News.php */