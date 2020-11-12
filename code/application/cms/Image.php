<?php // code/application/cms/Image.php

class Image extends MyApplication
{
    private $_common = array();
    private $_file   = null;
    private $_upload   = null;

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
        $this->_lh = $this->getClass( 'LH_FW', 'image' );

        // 認証不可ならログイン画面へ
        if(! $this->_lh->isAuth() ) {
            $this->_lh->goLogin();
            exit();
        }

        // モデルクラスを指定
        $this->_model = new Model(true, array(
            'table'   => 'cms_image',
            'id'      => 'image_id',
            'bind'    => array(
                'image_id' => 'INTEGER',
                'width'    => 'INTEGER',
                'height'   => 'INTEGER',
                'size'     => 'INTEGER',
                'up_time'  => 'INTEGER',
            )
        ));

        // 汎用変数設定
        $this->page['mode_title'] = '画像';
        $this->page['this_id']    = $this->_model->getPrimary();
        $this->page['prefix']     = $this->_lh->getPrefix();
        $this->page['prev_num']   = $this->_lh->getBackPage();

        // ファイルクラスを設定
        // アップロードディレクトリを取得
        $this->loadConfig( 'upload_dir' );
        $this->_file = $this->getClass( 'Tool/File' );
        $this->_upload = $this->getClass( 'Tool/Upload' );
        $this->_upload->setUploadDir( $this->config['upload_dir']['path'] );
        $this->_upload->setMaxFileSize(32);

        // WYSIWYG経由か？
        $this->page['is_wysiwyg'] = $this->in('from') === 'wysiwyg';
        $this->page['append_query'] = array();
        if($this->page['is_wysiwyg']) {
            $this->page['append_query'] = array('from' => 'wysiwyg');

            if($this->in('CKEditor')) {
                $this->setSession('image_ckeditor', $this->in('CKEditor'));
                $this->setSession('image_ckeditor_funcnum', $this->in('CKEditorFuncNum'));
            }
        }
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
            $this->setHidden( 'internal_id', $internalId );

            // データ取得
            $this->page['data'] = $this->_model->id( $internalId );
        } else {
            // 件数取得、ページ数取得
            $listMax = 16;

            // 検索
            $query = '';
            $where = array();

            if($this->in('s')) {
                $query = 'org_name LIKE ?';
                $where = '%'.$this->in('s').'%';
            }

            // データ取得
            $this->page['data'] =
                $this->_model
                    ->listMax($listMax)
                    ->current($this->in('p'))
                    ->where($query, $where)
                    ->order('created', 'desc')
                    ->order('image_id', 'desc')
                    ->find();

            // ページャーのデータを取得
            $this->page['pager'] = $this->_model->getPager();
        }
    }


    /**
     * 一覧
     */
    public function index( $message = NULL )
    {
        $this->page['mode'] = '検索';
        $this->_setData();

        /** 一覧に戻るアドレス */
        $this->_lh->setBackPage( $this->in( 'p' ) );

        if( $message )
            $this->page['message'] = $this->_lh->getMessage( $message );

        if($this->in('s')) {
            $this->page['append_query']['s'] = $this->in('s');
        }

        echo $this->fetchPage( $this->page['prefix'].'/lists' );
    }

    /**
     * 新規追加
     *
     * @param string  $mode
     * @param integer $internalId
     */
    public function add()
    {
        $this->page['mode'] = '新規アップロード';

        // アップロード制限サイズを計算
        $upload_max = byteDecode( ini_get( 'upload_max_filesize' ) );
        $post_max   = byteDecode( ini_get( 'post_max_size' ) );
        $memory_max = byteDecode( ini_get( 'memory_limit' ) );
        $class_max  = byteDecode( $this->_upload->getMaxFileSize().'MB' );
        $this->page['max_file_size'] =
            byteConvert( min( $upload_max, $post_max, $memory_max, $class_max ) );

        echo $this->fetchPage( $this->page['prefix'].'/form' );
    }

    /**
     * 詳細表示
     *
     * @param integer $internalId
     */
    public function edit( $internalId, $message = NULL )
    {
        $this->page['mode'] = '詳細';
        $this->_setData($internalId);

        /** 一覧に戻るアドレス */
        $this->page['prev_link'] = $this->_lh->getBackLink( 'index' );

        if( $message )
            $this->page['message'] = $this->_lh->getMessage( $message );

        if($this->page['is_wysiwyg']) {
            $this->page['up_dir'] = $this->config['upload_dir']['url'].'/image/';
            echo $this->fetchPage( $this->page['prefix'].'/detail-wysiwyg' );
        } else {
            echo $this->fetchPage( $this->page['prefix'].'/detail' );
        }
    }

    /**
     * 画像表示
     *
     * @param integer $internalId
     */
    public function get( $internalId )
    {
        // 情報取得
        $this->_setData($internalId);

        // 存在しなければ終了
        if(! $this->page['data'] ) {
            exit();
        }

        $expires = 30;
        header( "Last-Modified: ". gmdate( "D, d M Y H:i:s", $this->page['data']['datetime'] ). " GMT" );
        header( "Expires: " . date( DATE_RFC1123, time() + $expires ) );
        header( "Pragma: cache");
        header( "Cache-Control: max-age={$expires}" );
        header( "Cache-Control: cache" );

        header( 'Content-type: '. $this->page['data']['type'] );
        echo $this->_file->readFile( $this->config['upload_dir']['path'].'/'.$this->page['data']['name'] );
    }

    /**
     * 削除
     *
     * @param integer $internalId
     */
    public function delete( $internalId )
    {
        // オリジナルデータを削除
        $data = $this->_model->id( $internalId );
        $org_data = $this->config['upload_dir']['path'].'/'.$data['name'];
        if( file_exists( $org_data ) ) {
            unlink( $org_data );
        }
        // 変換データを削除
        $this->_file->removeDirectory( $this->config['upload_dir']['path'].'/image/'.$internalId.'/' );

        // 削除
        $this->_model->delete( $internalId );
        $message = 'DELETED';

        // 画面遷移
        $this->redirect( feggUrlParam($this->_lh->getBackPath( 'index/'.$message ), $this->page['append_query']) );
    }

    /**
     * データ反映
     */
    public function update()
    {
        $this->_upload->upload( 'image', uniqid( 'i_' ) );
        $errorMessage = $this->_upload->getErrorMessage( 'image' );

        if (!$errorMessage) {
            // データ更新
            $data = $this->_upload->getUploadedData( 'image' );
            $item = 'name, width, height, size, org_name, type, up_time';

            // 新規登録
            $internalId = $this->_model->insert( $item, $data );
            $message = 'ADDED';

            // 画面遷移
            $this->redirect( feggUrlParam($this->page['prefix'].'/edit/'.$internalId.'/'.$message, $this->page['append_query']) );
        } else {
            // エラーメッセージ設定
            $this->page['error'] = $errorMessage;

            // 編集画面表示
            echo $this->fetchPage( $this->page['prefix'].'/form' );
        }
    }

}
/* End Of File: code/application/cms/Image.php */
