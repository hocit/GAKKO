<?php
/**
 * LionHeart CMS用 汎用拡張クラス
 *
 * LionHeart CMSに利用する処理を拡張
 *
 * 関連ファイル： LH_FW/functions.php
 *                LH_FW/modifire.php
 *
 * @access public
 * @author LionHeart Co., Ltd.
 * @version 1.0.0
 */

class LH_FW
{
    private $_prefix = '';
    // 管理画面のディレクトリフォルダ
    private $_folder = 'cms';
    private $_messages = array(
        'ERROR'     => array( 'type' => 'danger',  'cont' => 'エラーが発生しました' ),
        'NOT_FOUND' => array( 'type' => 'danger',  'cont' => '該当記事が見つかりませんでした' ),
        'ADDED'     => array( 'type' => 'success', 'cont' => '登録完了しました' ),
        'EDITED'    => array( 'type' => 'success', 'cont' => '編集完了しました' ),
        'DELETED'   => array( 'type' => 'success', 'cont' => '削除完了しました' ),
    );

    /**
     *  constructor
     *
     * @param string $prefix 接頭語
     */
    public function __construct( $prefix = null )
    {
        // アプリケーションオブジェクト
        $this->_app = FEGG_getInstance();
        $this->_app->setSiteInfo( 'cms_dir', FEGG_REWRITEBASE.'/'.$this->_folder );

        $this->setPrefix( $prefix );
    }

    /**
     * 接頭語を取得
     *
     * @return string
     */
    public function getPrefix()
    {
        return $this->_folder.'/'.$this->_prefix;
    }

    /**
     * 接頭語を更新
     *
     * @param string $prefix 接頭語
     */
    public function setPrefix( $prefix )
    {
        $this->_prefix = $prefix;
        $this->_app->setSiteInfo( 'prefix', FEGG_REWRITEBASE.'/'.$this->_folder.'/'.$this->_prefix );
    }

    /**
     * メッセージを取得する
     *
     * @param  string $message メッセージキー
     * @return array
     */
    public function getMessage( $message )
    {
        return isset( $this->_messages[ $message ] ) ? $this->_messages[ $message ] : '';
    }


    /**
     * 戻るリンク保存用のセッションを保存
     *
     * @return string
     */
    public function setBackPage( $page )
    {
        $this->_app->setSession( $this->_prefix.'_prev_page', $page );
    }


    /**
     * 戻るリンク保存用のセッションを取得
     *
     * @return string
     */
    public function getBackPage()
    {
        return $this->_app->getSession( $this->_prefix.'_prev_page' );
    }


    /**
     * 戻るリンクのURLを生成
     */
    public function getBackLink( $path )
    {
        $page = $this->getBackPage();
        if(! $page) {
            $page = '';
        }

        $q = strpos( $path, '?' ) === FALSE ? '?' : '&';
        return FEGG_REWRITEBASE.'/'.$this->_folder.'/'.$this->_prefix.'/'.$path.$q.'p='.$page;
    }

    /**
     * 戻るリンクのパスを生成
     */
    public function getBackPath( $path )
    {
        $page = $this->getBackPage();

        $q = strpos( $path, '?' ) === FALSE ? '?' : '&';
        return $this->_folder.'/'.$this->_prefix.'/'.$path.$q.'p='.$page;
    }


    /**
     * ログイン判定
     *
     * @return boolean
     */
    public function isAuth()
    {
        if( $this->_app->getSession( 'user_id' ) ) {
            $this->_app->page['isNotLogin'] = FALSE;
            return TRUE;
        }

        $this->_app->page['isNotLogin'] = TRUE;
        return FALSE;
    }


    /**
     * ログイン画面にジャンプ
     */
    public function goLogin()
    {
        $this->_app->redirect( $this->_folder.'/login' );
    }
}

$DIR = dirname( __FILE__ );
require_once( $DIR.'/LH_FW/functions.php' );
require_once( $DIR.'/LH_FW/modifire.php' );