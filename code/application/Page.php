<?php

/**
 * 静的テンプレート表示用のコントローラ
 * Controller for Static template
 */

class Page extends MyApplication {

    public function __init()
    {
        parent::__init();

        // LH用汎用クラスを読込
        // Load general class for LH Fegg
        $this->_lh    = $this->getClass( 'LH_FW' );
    }

    /**
     * テンプレート呼び出し
     * path/to/win_hoge.html のように、末のパラメータに「win_」と指定すると、X-FRAME-OPTIONS: DENYを付けずに表示します
     *
     * Load template
     * You can call ignore "X-FRAME-OPTIONS: DENY", when load template file name append "win_" to head seems to "path/to/win_foo.html".
     */
    public function render()
    {
        $args = func_get_args();

        // 最後の値をチェック
        // Check file name
        $param = end( $args );
        if( strpos( $param, 'win_' ) === 0 ) {
            call_user_func_array( array( $this, 'window' ), $args );
            exit();
        }

        try {
            $this->displayPage( implode( '/', $args ) );
        } catch( Exception $e ) {
            // テンプレートが見つからなかった時
            // If can not find a template
            $this->redirect( '/' );

            // 404用のテンプレを出すのもあり
            // It's OK that load template for Not Found.
            // $this->displayPage( 'notfound' );
        }
    }

    /**
     * X-FRAME-OPTIONS: DENYを付けずに表示
     * Load template ignore X-FRAME-OPTIONS: DENY
     */
    public function window()
    {
        $args = func_get_args();

        try {
            echo $this->fetchPage( implode( '/', $args ) );
        } catch( Exception $e ) {
            // テンプレートが見つからなかった時
            // If can not find a template
            $this->redirect( '/' );

            // 404用のテンプレを出すのもあり
            // It's OK that load template for Not Found.
            // echo $this->fetchPage( 'notfound' );
        }
    }

}
