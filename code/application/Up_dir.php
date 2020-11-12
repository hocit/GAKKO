<?php // code/application/admin/Updir.php

class Up_dir extends MyApplication
{
    private $_common   = array(),
            $up_dir    = NULL;

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

        // アップロードディレクトリ
        $this->up_dir = FEGG_HTML_DIR.'/up_dir';
        $this->TRIM   = $this->getClass( 'Tool/Trim' );
    }


    /**
     * 画像取得
     * Get image
     *
     * @param integer $id
     * @param string $file_name
     */
    public function image( $id, $file_name )
    {
        set_time_limit( 0 );

        if( preg_match( '/^(\w+?)-?(.*?)\.(\w*)$/', $file_name, $matches ) ) {
            $file_name = $this->up_dir.'/image/'.$id.'/'.$file_name;

            // 変換タイプ、変換形式の整合性確認
            // Check convert type arguments
            if(
                ! preg_match( '/i|c|f|t|rt|l|m|r|lb|b|rb|lt/i', $matches[1] ) ||
                ! preg_match( '/jpg|gif|png/i', $matches[3] )
            ) {
                exit( 'Error Param' );
            }

            $w = $h = 0;
            if( isset( $matches[2] ) && strlen( $matches[2] ) > 0 ) {
                $size = explode( '_', $matches[2] );
                $w    = isset( $size[0] ) ? (int)$size[0] : 0;
                $h    = isset( $size[1] ) ? (int)$size[1] : 0;
            }

            $model = new Model(false, array(
                'table'   => 'cms_image',
                'id'      => 'image_id',
            ));
            $org_data = $model->id( $id );

            if(! $org_data ) {
                exit( 'Not Found' );
            }

            $file = $this->up_dir.'/'.$org_data['name'];
            $this->TRIM->setImage( $file, $file_name );

            switch( $matches[1] ) {
                // 比率を保持してリサイズ
                // Resize to hold ratio
                case 'i':
                    $this->TRIM->resize( $w, $h );
                    break;
                // 比率を保持してリサイズ（足りない部分は透明 or 白に）
                // Resize to hold ratio, and blank area filled transparent or white
                case 'c':
                    $this->TRIM->resizeFill( $w, $h );
                    break;
                // 比率を無視してリサイズ
                // Resize to ignore ratio
                case 'f':
                    $this->TRIM->resizeForce( $w, $h );
                    break;
                // リサイズして指定位置でトリミング
                // Resize to hold ratio, and trim at specified location
                default:
                    $this->TRIM->resizeTrim( $w, $h, $matches[1] );
                    break;
            }

            $this->TRIM->create();
            $this->TRIM->view();

        } else {
            exit( 'Not Found' );
        }
    }


    /**
     * ファイル取得
     * Get file
     *
     * @param integer $id
     */
    public function file( $id )
    {
        // データ取得
        // Get data from DB
        $model = new Model(false, array(
            'table'   => 'cms_file',
            'id'      => 'file_id',
        ));
        $this->page['data'] = $model->id( $id );

        // File Class
        $this->loadConfig( 'upload_dir' );
        $fileClass = $this->getClass( 'Tool/File' );
        $uploadClass = $this->getClass( 'Tool/Upload' );
        $uploadClass->setUploadDir( $this->config['upload_dir']['path'] );

        if(! $this->page['data'] ) {
            exit();
        }

        $expires = 30;
        header( "Last-Modified: ". gmdate( "D, d M Y H:i:s", $this->page['data']['up_time'] ). " GMT" );
        header( "Expires: " . date( DATE_RFC1123, time() + $expires ) );
        header( "Pragma: cache");
        header( "Cache-Control: max-age={$expires}" );
        header( "Cache-Control: cache" );

        // ファイル名を指定
        // Specify file name
        // via: http://d.hatena.ne.jp/scientre/20140123/http_attachment_filename
        // Shift-JISに変換で対応
        if( preg_match('/\bMSIE\b|\bSafari [12345]\b/', getenv('HTTP_USER_AGENT') ) ) {
            header( 'Content-Disposition: inline; filename="' . mb_convert_encoding($this->page['data']['org_name'], 'Shift_JIS', 'UTF-8') . '"' );
        } else {
            header( 'Content-Disposition: inline; filename*=UTF-8\'\'' . rawurlencode($this->page['data']['org_name']) );
        }

        // ファイルサイズとファイルタイプを追加
        // Append file length and type
        header( 'Content-Length: '. $this->page['data']['size'] );
        header( 'Content-type: '. $this->page['data']['type'] );
        echo $fileClass->readFile( $this->config['upload_dir']['path'].'/'.$this->page['data']['name'] );
    }
}