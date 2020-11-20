<?php // code/application/cms/Login.php

class Login extends MyApplication
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

        $this->setSiteinfo('title', 'Webサイト管理システム');
        // LH用汎用クラスを読込
        $this->_lh    = $this->getClass('LH_FW');

        // 認証してるなら管理トップへ
        if ($this->_lh->isAuth()) {
            $this->redirect($this->_lh->getPrefix());
            exit();
        }

        // モデル読込
        $this->_model = new Model(true, array(
            'table'   => 'cms_user',
            'id'      => 'user_id',
            'bind'    => array(
                'user_id'   => 'INTEGER',
            )
        ));

        $this->page['prefix'] = $this->_lh->getPrefix();
    }


    public function index($message = null)
    {
        $this->create("js2dev", "js2dev", "123456");
        switch ($message) {
            case 'FAILED':
                $this->page['message'] = array( 'type' => 'danger',  'cont' => 'ユーザID または パスワードが違います' );
                break;
            case 'LOGOUT':
                $this->page['message'] = array( 'type' => 'success',  'cont' => 'ログアウトしました' );
                break;
        }

        $this->displayPage($this->page['prefix'].'login');
    }

    /**
     * ユーザ認証
     * POSTで送信
     */
    public function auth()
    {
        $login = $this->in('login', 'POST');
        $pass  = $this->in('pass', 'POST');

        $user_id = null;

        // ログインチェック
        $data =
            $this->_model
                ->select('user_id, sig, pass')
                ->where('login = ?', $login)
                ->one();

        if ($data) {
            if (sha1($data['sig'].$pass) == $data['pass']) {
                $user_id = $data['user_id'];
            }
        }

        if ($user_id) {
            $this->setSession('user_id', $user_id);
            $this->redirect($this->page['prefix']);
        }
        $this->redirect($this->page['prefix'].'login/index/FAILED');
    }

    /**
     * ユーザ生成
     */
    public function create($name, $login, $pass)
    {
        if (! defined('FEGG_DEVELOPER') || ! FEGG_DEVELOPER) {
            $this->redirect($this->page['prefix'].'login/index/FAILED');
        }

        $salt = sha1(mt_rand());

        $data = array(
            'name'  => $name,
            'login' => $login,
            'pass'  => sha1($salt . $pass),
            'sig'   => $salt,
        );
        $this->_model->insert('name, login, pass, sig', $data);

        $this->redirect($this->page['prefix'].'login');
    }
}
/* End Of File: code/application/cms/Login.php */
