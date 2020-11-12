<?php
/**
 * Tool_Uploadクラス
 *
 * Fileのアップロード処理を提供するクラス。
 * 関連ファイル： file_error_message.php
 *
 * @access public
 * @author Genies, Inc.
 * @version 1.3.0
 */
class Upload
{
    /**
     * アップロード用変数群
     */
    /** アップロードディレクトリ */
    private $_upDir        = '';
    /** ファイル容量制限（MB） */
    private $_maxFileSize = 2;
    /** ファイルタイプ制限（拡張子） */
    private $_fileType     = array( 'jpg', 'jpeg', 'png', 'gif' );
    /** アップロードしたデータ */
    private $_uploadedData = array();
    /** エラーメッセージ */
    private $_errorMessage = array();
    /** エラーフラグ */
    private $_errorFlag;
    private $_fileErrorMessage;

    function __construct($languageCode = null)
    {
        if ($languageCode) {
            $languageCode = '/' . $languageCode;
        }

        // エラーメッセージ取得
        if( file_exists( FEGG_CODE_DIR . "/config" . $languageCode . "/file_error_message.php" ) ) {
            require(FEGG_CODE_DIR . "/config" . $languageCode . "/file_error_message.php");

            $this->_fileErrorMessage = $file_error_message;
        }
    }

    /**
     * アップロードディレクトリの更新
     *
     * @param  string $dir
     * @return boolean
     */
    public function setUploadDir( $dir )
    {
        if(! is_dir( $dir ) ) {
            if(! @mkdir( $dir, 0777, TRUE ) ) {
                return FALSE;
            }
        }

        if( is_writable( $dir ) ) {
            $this->_upDir = $dir;
            return TRUE;
        } else return FALSE;
    }

    /**
     * アップロードディレクトリの取得
     *
     * @return string
     */
    public function getUploadDir()
    {
        return $this->_upDir;
    }

    /**
     * ファイル容量制限（MB）
     *
     * @param  integer $size
     * @return boolean
     */
    public function setMaxFileSize( $size )
    {
        if( is_numeric( $size ) ) {
            $this->_maxFileSize = $size;
            return TRUE;
        } return FALSE;
    }

    /**
     * ファイル容量制限（MB）の取得
     *
     * @return integer
     */
    public function getMaxFileSize()
    {
        return $this->_maxFileSize;
    }

    /**
     * ファイルタイプ制限（拡張子）
     *
     * @param  array $type
     * @return boolean
     */
    public function setFileType( $type ) {
        if( is_array( $type ) ) {
            $this->_fileType = array_map('strtolower', $type);
            return TRUE;
        } return FALSE;
    }

    /**
     * ファイルタイプ制限（拡張子）の取得
     *
     * @return array
     */
    public function getFileType()
    {
        return $this->_fileType;
    }

    /**
     * アップロード用変数群の一括更新
     *
     * @param array $data
     *          string  [ upDir ]        アップロードディレクトリ
     *          integer [ maxFileSize ] ファイル容量制限（MB）
     *          array   [ fileType ]     ファイルタイプ制限（拡張子）
     * @return boolean
     */
    public function setUploadInfo( $data )
    {
        $result = true;

        // アップロードディレクトリ
        if( isset( $data['upDir'] ) ) {
            $result = $result && $this->setUploadDir( $data['upDir'] );
        }
        // ファイル容量制限（MB）
        if( isset( $data['maxFileSize'] ) ) {
            $result = $result && $this->setMaxFileSize( $data['maxFileSize'] );
        }
        // ファイルタイプ制限（拡張子）
        if( isset( $data['fileType'] ) ) {
            $result = $result && $this->setFileType( $data['fileType'] );
        }

        return $result;
    }

    /**
     * ファイルアップロード
     *   エラー内容は $_errorMessage に格納されます
     *
     * @param  string $name    input[type="file"]のname属性
     * @param  string $up_name アップロード後のファイル名
     * @param  string $label   エラー表示用の汎用名
     * @return boolean
     */
    public function upload( $name, $up_name, $label = "ファイル", $required = true )
    {
        $flag = TRUE;
        $this->_errorMessage[$name] = array();

        if ( $_FILES[$name]["size"] !== 0 && ! empty( $_FILES[$name] ) ) {
            $extension = strtolower(pathinfo( $_FILES[$name]["name"], PATHINFO_EXTENSION ));

            /** ファイルサイズの確認 */
            if( $_FILES[$name]["size"] > $this->_maxFileSize*1024*1024 ) {
                $flag = FALSE;
                $this->_setError( $name, array( '@size', $label ) );
            }

            /** ファイルタイプの確認 */
            if( is_array( $this->_fileType ) && ! in_array( $extension, $this->_fileType ) ) {
                $flag = FALSE;
                $this->_setError( $name, array( '@type', $label ) );
            }

            /** 確認OKなら公開領域に移動 */
            if( $flag ) {
                $file_place = sprintf( "%s/%s.%s", $this->_upDir, $up_name, $extension );
                if( @move_uploaded_file( $_FILES[$name]["tmp_name"], $file_place ) ) {
                    $data = array();

                    if (FALSE !== ( $D = @getimagesize( $file_place ) ) ) {
                        list( $data['width'], $data['height'], $data['type'], $data['attr'] ) = $D;
                        $data['type']     = image_type_to_mime_type( $data['type'] );
                    } else {
                        $data['type'] = $this->getMymeType( $file_place, $extension );
                    }
                    $data['org_name'] = $_FILES[$name]["name"];
                    $data['name']     = $up_name.".".$extension;
                    $data['size']     = filesize( $file_place );
                    $data['up_time']  = time();
                    $this->_uploadedData[ $name ] = $data;
                } else {
                    $flag = FALSE;
                    $this->_setError( $name, array( '@failed', $label ) );
                }
            }
        } else {
            if ($required) {
                $flag = FALSE;
                $this->_setError( $name, array( '@empty', $label ) );
            }
        }

        return $flag;
    }

    /**
     * ファイルのMIMEタイプを判定
     *
     * @access private
     * @param  string $file_place ファイルパス
     * @param  string $extension  拡張子
     * @return string
     */
    private function getMymeType( $file_place, $extension )
    {
        switch( strtolower( $extension ) ) {
            // START MS Office 2007 Docs
            case 'docx':
                return 'application/vnd.openxmlformats-officedocument.wordprocessingml.document';
            case 'docm':
                return 'application/vnd.ms-word.document.macroEnabled.12';
            case 'dotx':
                return 'application/vnd.openxmlformats-officedocument.wordprocessingml.template';
            case 'dotm':
                return 'application/vnd.ms-word.template.macroEnabled.12';
            case 'xlsx':
                return 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet';
            case 'xlsm':
                return 'application/vnd.ms-excel.sheet.macroEnabled.12';
            case 'xltx':
                return 'application/vnd.openxmlformats-officedocument.spreadsheetml.template';
            case 'xltm':
                return 'application/vnd.ms-excel.template.macroEnabled.12';
            case 'xlsb':
                return 'application/vnd.ms-excel.sheet.binary.macroEnabled.12';
            case 'xlam':
                return 'application/vnd.ms-excel.addin.macroEnabled.12';
            case 'pptx':
                return 'application/vnd.openxmlformats-officedocument.presentationml.presentation';
            case 'pptm':
                return 'application/vnd.ms-powerpoint.presentation.macroEnabled.12';
            case 'ppsx':
                return 'application/vnd.openxmlformats-officedocument.presentationml.slideshow';
            case 'ppsm':
                return 'application/vnd.ms-powerpoint.slideshow.macroEnabled.12';
            case 'potx':
                return 'application/vnd.openxmlformats-officedocument.presentationml.template';
            case 'potm':
                return 'application/vnd.ms-powerpoint.template.macroEnabled.12';
            case 'ppam':
                return 'application/vnd.ms-powerpoint.addin.macroEnabled.12';
            case 'sldx':
                return 'application/vnd.openxmlformats-officedocument.presentationml.slide';
            case 'sldm':
                return 'application/vnd.ms-powerpoint.slide.macroEnabled.12';
            case 'one':
                return 'application/msonenote';
            case 'onetoc2':
                return 'application/msonenote';
            case 'onetmp':
                return 'application/msonenote';
            case 'onepkg':
                return 'application/msonenote';
            case 'thmx':
                return 'application/vnd.ms-officetheme';
                //END MS Office 2007 Docs
        }

        // others
        $mymetype = 'application/octet-stream';

        if( function_exists( 'finfo_open' ) ) {
            $finfo = finfo_open( FILEINFO_MIME_TYPE );
            $mymetype = finfo_file( $finfo, $file_place );
            finfo_close($finfo);
        } else if( function_exists( 'mime_content_type' ) ) {
            $mymetype = mime_content_type( $file_place );
        }

        return $mymetype;
    }

    /**
     * アップロードしたデータの情報を取得する
     *
     * @param  string $name input[type="file"]のname属性
     * @return mixed
     */
    public function getUploadedData( $name )
    {
        if( isset( $this->_uploadedData[$name] ) && $this->_uploadedData[$name] ) {
            return $this->_uploadedData[$name];
        }
        return NULL;
    }

    /**
     * エラー設定（コード指定）
     *
     * @param string $name 項目名
     * @param string $code エラーコード
     */
    private function _setError($name, $code = '')
    {
        $this->_errorFlag = true;
        if (is_array($code)) {
            // $codeがarray型の場合は、array[0]:基本文章コード、array[1]:パラメーター１コード、array[2]..と続く
            $statement = array_shift($code);
            $word = array();
            foreach ($code as $key => $value) {
                $word[] = isset($this->_fileErrorMessage[$value]) ? $this->_fileErrorMessage[$value] : $value;
            }
            $this->_errorMessage[$name] = vsprintf($this->_fileErrorMessage[$statement], $word);
        } else {
            $this->_errorMessage[$name] = isset($this->_fileErrorMessage[$code]) ? $this->_fileErrorMessage[$code] : $code;
        }
    }

    /**
     * 実行時点でのエラー有無判定
     * @return boolean エラー時： true / 正常時： false
     */
    public function isError()
    {
        return $this->_errorFlag;
    }

    /**
     * エラーメッセージの取得
     *
     * @param  string $name input[type="file"]のname属性
     * @return mixed
     */
    public function getErrorMessage( $name )
    {
        if( isset( $this->_errorMessage[$name] ) && count( $this->_errorMessage[$name] ) > 0 ) {
            return $this->_errorMessage[$name];
        }
        return NULL;
    }
}