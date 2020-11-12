<?php
/**
 * テンプレート用モディファイア関数
 *
 * @author LionHeart Co., Ltd.
 * @version 1.0.0
 */


/**
 * 画像表示用のURLを生成
 *
 * @param integer $image_id
 */
function getImageUrl( $image_id, $w = NULL, $h = NULL, $crop = 'i' )
{
    $app = FEGG_getInstance();
    $app->loadConfig( 'upload_dir' );

    if( $w && $h ) {
        return sprintf( $app->config['upload_dir']['url'].'/image/%d/%s-%d_%d.jpg', $image_id, $crop, $w, $h );
    } else if( $w ) {
        return sprintf( $app->config['upload_dir']['url'].'/image/%d/%s-%d.jpg', $image_id, $crop, $w );
    } else {
        return sprintf( $app->config['upload_dir']['url'].'/image/%d/%s.jpg', $image_id, $crop );
    }
}


/**
 * 画像表示用のURLを生成（毎回生成）
 *
 * @param integer $image_id
 */
function getImageUrlFromDB( $image_id, $w = NULL, $h = NULL )
{
    if( $w && $h ) {
        return sprintf( FEGG_REWRITEBASE.'/cms/image/get/%d/%d/%d', $image_id, $w, $h );
    } else if( $w ) {
        return sprintf( FEGG_REWRITEBASE.'/cms/image/get/%d/%d', $image_id, $w );
    } else {
        return sprintf( FEGG_REWRITEBASE.'/cms/image/get/%d', $image_id );
    }
}


/**
 * ファイル表示用のURLを生成
 *
 * @param integer $file_id
 */
function getFileUrl( $file_id )
{
    $app = FEGG_getInstance();
    $app->loadConfig( 'upload_dir' );

    return sprintf( $app->config['upload_dir']['url'].'/file/%d', $file_id );
}


/**
 * 生ファイルのURLを生成
 *
 * @param integer $file_id
 */
function getFileRawUrl( $file_id )
{
    $app   = FEGG_getInstance();
    $model = $app->loadModel( 'File' );
    $file  = $model->id( $file_id );
    return $app->config['upload_dir']['url'].'/'.$file['name'];
}


/**
 * バイトコンバート
 *
 * @param  int     $bytes
 * @return string
*/
function byteConvert($bytes){
    $s = array('B', 'KB', 'MB', 'GB', 'TB', 'PB');
    $e = floor(log($bytes)/log(1024));
    return sprintf('%.1f '.$s[$e], ($bytes/pow(1024, floor($e))));
}


/**
 * バイトデコード
 *
 * @param  string $bytes
 * @return int
 */
function byteDecode( $bytes )
{
    $s = array('B', 'KB', 'MB', 'GB', 'TB', 'PB');
    if( preg_match( '/([0-9\.]*)(.*)$/', $bytes, $match ) ) {
        $pow = array_search( $match[2], $s );
        if( $pow === FALSE ) {
            // 最後に「B」がついていない可能性も考慮する
            $pow = array_search( $match[2].'B', $s );
        }
        if( $pow !== FALSE ) {
            $bytes = $match[1] * pow( 1024, $pow );
        }
    }
    return $bytes;
}


/**
 * 改行やタグを削除して指定文字数で丸め込む
 * @param  string  $str
 * @param  integer $length
 * @param  string  $delimiter
 * @return string
 */
function lineStrimWidth( $str, $length = NULL, $delimiter = '…' )
{
    $str = preg_replace('/\<style(.*?)\>(.*?)\<\/style\>/s', '', $str);

    $str = html_entity_decode($str, ENT_QUOTES, 'UTF-8');
    $str = str_replace('&lsquo;', '', $str);

    $str = strip_tags( str_replace( array( "\r\n", "\n", "\r" ), '', $str ) );
    if( $length > 0 ) {
        $str = mb_strimwidth( $str, 0, $length, $delimiter, FEGG_DEFAULT_CHARACTER_CODE );
    }
    return $str;
}

/**
 * Add anchor tag for URL string
 * @param  string  $body
 * @param  boolean $blank
 * @param  string  $link_title
 * @return string
 */
function url2link($body, $blank = false, $link_title = null)
{
    $url2link = new Url2Link_class($blank, $link_title);

    $pattern = '/(href=")?https?:\/\/[-_.!~*\'()a-zA-Z0-9;\/?:@&=+$,%#]+/';
    return preg_replace_callback($pattern, array($url2link, 'replace'), $body);
}

/**
 * The class for url2link
 */
class Url2Link_class
{
    private $blank      = false;
    private $link_title = null;

    /**
     * Construct
     *
     * @param boolean $blank
     * @param string $link_title
     */
    public function __construct($blank = false, $link_title = null)
    {
        $this->blank      = $blank;
        $this->link_title = $link_title;
    }

    /**
     * Callback function for preg_replace_callback
     *
     * @param array $matches
     */
    public function replace($matches)
    {
        // 既にリンクの場合や Markdown style link の場合はそのまま
        if (isset($matches[1])) {
            return $matches[0];
        }

        $this->link_title = $this->link_title ?
                            $this->link_title : $matches[0];
        if($this->blank) {
            return
                "<a href=\"{$matches[0]}\" target=\"_blank\">" .
                $this->link_title .
                "</a>";
        } else {
            return
                "<a href=\"{$matches[0]}\">" .
                $this->link_title .
                "</a>";
        }
    }
}

/**
 * Create Seach Query Parameter
 *
 * @param array $except
 * @param array $add
 * @return string
 */
function createSearchQuery($except = array(), $add = array())
{
    $app = FEGG_getInstance();
    $in  = $app->in();

    if (!is_array($in)) {
        $in = array();
    }

    // Remove Pager Number
    if(isset($in['p'])) {
        unset($in['p']);
    }

    // Remove Dicition Parameter
    foreach($except as $e) {
        if(isset($in[$e])) {
            unset($in[$e]);
        }
    }

    // Add Dicition Parameter
    foreach($add as $k => $a) {
        $in[$k] = $a;
    }

    return http_build_query($in);
}

/**
 * Display Seach Query Parameter
 *
 * @param array $except
 * @param array $add
 * @return void
 */
function echoSearchQuery($except = array(), $add = array())
{
    echo createSearchQuery($except, $add);
}
