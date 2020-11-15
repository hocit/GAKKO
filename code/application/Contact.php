<?php // code/application/Contact.php

/**
 * お問い合わせフォームサンプルクラス
 * Contact form sample class
 *
 * _validatePostedData()
 *   入力検証
 *   Validate input data
 *
 * index()
 *   入力画面
 *   Input window
 *
 * confirm()
 *   確認画面
 *   Confirm window
 *
 * error()
 *   エラー画面
 *   Error window
 *
 * post()
 *   メール送信
 *   送信完了はresult.htmlにリダイレクト
 *   Send Email
 *   After that, redirect to result.html
 *
 * result()
 *   送信完了画面
 *   Result window
 */

class Contact extends MyApplication
{
    private $_common;
    private $_config = array();

    /**
     * コンストラクタ
     * Constructor
     */
    public function __construct()
    {
        parent::__construct();

        $this->page['contact_common'] =
            require(FEGG_CODE_DIR.'/config/contact/common.php');
        $this->contact_config =
            require(FEGG_CODE_DIR.'/config/contact/contact_config.php');
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

        $this->loadConfig('site_info');
        foreach ($this->config['site_info'] as $key => $val) {
            $this->setSiteInfo($key, $val);
        }

        // LH用汎用クラスを読込
        $this->_lh = $this->getClass('LH_FW');
    }


    /**
     * エラーチェック
     * Validate input data
     *
     * @return mixed $errorMessage
     */
    private function _validatePostedData()
    {
        $validation = $this->getClass('Validation');

        $name = 'お問い合わせ種別';
        $id = 'type_request';
        $validation->required($id, $this->in($id), array('@required',  $name));

        $name = 'お子様のお名前';
        $id = 'child_name';
        $validation->required($id, $this->in($id), array('@required',  $name));

        $name = 'ふりがな';
        $id = 'child_name_furigana';
        $validation->required($id, $this->in($id), array('@required',  $name));

        $name = 'お子様の年齢・学年';
        $id = 'child_age';
        $validation->required($id, $this->in($id), array('@required',  $name));

        $name = '保護者様のお名前';
        $id = 'parent_name';
        $validation->required($id, $this->in($id), array('@required',  $name));

        $name = 'ふりがな';
        $id = 'parent_name_furigana';
        $validation->required($id, $this->in($id), array('@required',  $name));

        $name = 'メールアドレス';
        $id = 'email';
        $validation->required($id, $this->in($id), array('@required',  $name));

        $name = 'お電話番号';
        $id = 'tel';
        $validation->required($id, $this->in($id), array('@required',  $name));

        $name = 'ご住所';
        $id = 'address';
        $validation->required($id, $this->in($id), array('@required',  $name));

        $name = '同意する';
        $id = 'iagree';
        $validation->required($id, $this->in($id), array('@required',  $name));

        // 正当性確認
        // Return validate result
        return $validation->getErrorMessage();
    }


    /**
     * 入力画面
     * Input window
     */
    public function index()
    {
        if ($this->getSession($this->contact_config['session_key_form'])) {
            $this->page['data'] = $this->getSession($this->contact_config['session_key_form']);
            $this->unsetSession($this->contact_config['session_key_form']);
        }

        $this->displayPage($this->contact_config['template'].'/input');
    }


    /**
     * 確認画面
     * Confirm window
     */
    public function confirm()
    {
        $this->page['data'] = $this->in();
        $this->setSession($this->contact_config['session_key_form'], $this->page['data']);

        // エラーチェック
        // Check validation
        $errorMessage = $this->_validatePostedData();

        if (! $errorMessage) {
            $this->setTicket($this->contact_config['session_key_ticket']);

            $this->displayPage($this->contact_config['template'].'/confirm');
        } else {
            // エラーメッセージ設定
            // Setting Error message
            $this->setSession($this->contact_config['session_key_error'], $errorMessage);
            $this->redirect($this->contact_config['error_url']);
        }
    }


    /**
     * エラー画面
     * Error window
     */
    public function error()
    {
        if (! $this->getSession($this->contact_config['session_key_form'])) {
            $this->redirect($this->contact_config['input_url']);
        }

        $this->page['data']  = $this->getSession($this->contact_config['session_key_form']);
        $this->unsetSession($this->contact_config['session_key_form']);
        $this->page['error'] = $this->getSession($this->contact_config['session_key_error']);
        $this->unsetSession($this->contact_config['session_key_error']);

        $this->displayPage($this->contact_config['template'].'/input');
    }


    /**
     * メール送信
     * Send Email
     */
    public function post()
    {
        var_dump("a");
        if (
            ! $this->useTicket($this->contact_config['session_key_ticket']) ||
            ! $this->getSession($this->contact_config['session_key_form'])
        ) {
            $this->setSession($this->contact_config['session_key_error'], array('不明のエラー'));
            $this->redirect($this->contact_config['error_url']);
        }

        // 入力データをセッションから取得
        // Get input data from Session
        $this->page['data'] = $this->getSession($this->contact_config['session_key_form']);

        // 返信先設定
        // Setting reply to
        $cli_address = array();
        foreach (explode(',', $this->page['data'][$this->contact_config['client_mail']]) as $address) {
            $cli_address[] = $address;
        }
        $cli_name = array();
        foreach (explode(',', $this->page['data'][$this->contact_config['client_name']]) as $name) {
            $cli_name[] = $name;
        }
        $cli_name = implode(' ', $cli_name);

        // メールクラス
        // Get Mail class
        $this->getClass('Tool/Mail');

        /**
         * 自動返信メール
         * For client mail
         */
        $cli_subject = $this->contact_config['to_client_subject'];
        $cli_body    = $this->fetchPage('/'.$this->contact_config['template'].'/mail/to_client');
        $cli_mail    = new Mail($cli_subject, $cli_body);
        $cli_mail->setDebugFlag(
            $this->contact_config['send_debug'],
            FEGG_CODE_DIR.'/data/log/'.$this->contact_config['template'].'_client.log'
        );

        /**
         * 管理者向けメール
         * For Administrator mail
         */
        $adm_subject = $this->contact_config['to_admin_subject'];
        $adm_body    = $this->fetchPage('/'.$this->contact_config['template'].'/mail/to_admin');
        $adm_mail    = new Mail($adm_subject, $adm_body);
        $adm_mail->setDebugFlag(
            $this->contact_config['send_debug'],
            FEGG_CODE_DIR.'/data/log/'.$this->contact_config['template'].'_admin.log'
        );

        $_FLAG = true;
        foreach ($cli_address as $address) {
            $_FLAG =
                $_FLAG &&
                $cli_mail->send(
                    $address,
                    $this->contact_config['admin_name'],
                    $this->contact_config['admin_from']
                );
        }

        if (
            $_FLAG &&
            $adm_mail->send(
                $this->contact_config['admin_mail'],
                $this->contact_config['admin_name'],
                $this->contact_config['admin_from']
            )
        ) {
            // 送信成功
            // Succeed
            $this->unsetSession($this->contact_config['session_key_form']);
            // result.htmlにリダイレクト
            // Redirect to result.html
            $this->redirect($this->contact_config['result_url']);
        } else {
            // 送信失敗
            // Failed
            $this->setSession(
                $this->contact_config['session_key_error'],
                array('メールの送信に失敗しました')
            );
            $this->redirect($this->contact_config['error_url']);
        }
    }

    /**
     * 送信完了画面
     * Result window
     */
    public function result()
    {
        $this->displayPage($this->contact_config['template'].'/result');
    }
}
/* End Of File: code/application/Contact.php */
