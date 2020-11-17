<?php

// `$_is_debug`有効時は、`$_ADMIN_TEST`宛にメールを送ります
// If `$_is_debug` is true, This form send to `$_ADMIN_TEST` address.
$_is_debug = false;
// `$_is_send_debug`有効時はメールを送らず、`/code/data/log`にログを出力します
// If `$_is_send_debug` is true, Don't send E-mail and export log text to `/code/data/log`
$_is_send_debug = false;

// セッションキー（複製したら変更すること）
// Session key (If you duplicate config file, you must change this value)
$_SESSION_KEY = 'contact_ses_';

// テンプレートパス
// Template path
$_TEMPLATE_PATH = 'contact2';

// 入力ページURL
// Input Page URL
$_PAGE_URL_INPUT = '/school/schola/contact/';
// 確認ページURL
// Confirm Page URL
$_PAGE_URL_CONFIRM = '/school/schola/contact/confirm.html';
// エラーページURL
// Error Page URL
$_PAGE_URL_ERROR = '/school/schola/contact/error.html';
// 完了ページURL
// Result Page URL
$_PAGE_URL_RESULT = '/school/schola/contact/complete.html';

// 企業名
// Company name
$_ADMIN_NAME = '株式会社学校良品';
// 企業ドメイン
// Company domain
$_ADMIN_DOMAIN = 'gakkou-ryouhin.com';

// 管理者アドレス
// Adoministrator's address
$_ADMIN_MAIL    = 'nguyentrunghung.19091989@gmail.com';
// テスト用アドレス
// Tester's address
$_ADMIN_TEST    = 'check@lionheart.co.jp';
// 閲覧者向け送信元アドレス
// Send from address for viewers
$_ADMIN_FROM    = 'nguyentrunghung.19091989@gmail.com';
// 管理者向けメール件名
// Subject for administrator
$_ADMIN_SUBJECT = 'ホームページからスコーラについてお問い合わせがありました';

// 閲覧者アドレスフィールド（カンマ区切りで複数指定可）
// Input field name that viewer's address
$_CLIENT_MAIL    = 'email';
// 閲覧者名フィールド（カンマ区切りで複数指定可）
// Input field name that viewer's name
$_CLIENT_NAME    = 'parent_name';
// 閲覧者向けメール件名
// Subject for Viewers
$_CLIENT_SUBJECT = 'スコーラについてお問い合わせありがとうございます';


/**
 * 以下は触らない ----------------------------------------
 * Don't touch line below --------------------------------
 */

$contact_config = array(
    'send_debug'         => $_is_send_debug,
    'session_key_form'   => $_SESSION_KEY.'form',
    'session_key_error'  => $_SESSION_KEY.'error',
    'session_key_ticket' => $_SESSION_KEY.'ticket',
    'template'           => $_TEMPLATE_PATH,
    'input_url'          => $_PAGE_URL_INPUT,
    'confirm_url'        => $_PAGE_URL_CONFIRM,
    'error_url'          => $_PAGE_URL_ERROR,
    'result_url'         => $_PAGE_URL_RESULT,
    'admin_name'         => $_ADMIN_NAME,
    'admin_mail'         => $_is_debug ? $_ADMIN_TEST : $_ADMIN_MAIL,
    'admin_from'         => $_ADMIN_FROM,
    'to_admin_subject'   => ($_is_debug ? '【TEST】' : '').$_ADMIN_SUBJECT,
    'client_mail'        => $_CLIENT_MAIL,
    'client_name'        => $_CLIENT_NAME,
    'to_client_subject'  => ($_is_debug ? '【TEST】' : '').$_CLIENT_SUBJECT,
);

return $contact_config;
