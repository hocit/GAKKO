<?php
/**
 * URIルーティング
 * URL Routing
 *
 * 先に設定されたものほど優先度は高い
 * Higher routes will always take precedence over lower ones.
 */

// index.html対策
$route[':any/index.html'] = '$1/index';

// For School
$route['school/'] = 'school/index';
$route['school/index.html'] = 'school/index';

// For Schola
$route['school/schola'] = 'schola/index';
$route['school/schola/index.html'] = 'schola/index';

// For Curriculum
$route['school/curriculum'] = 'curriculum/index';
$route['school/curriculum/index.html'] = 'curriculum/index';

// For Developer
$route['school/developer'] = 'developer/index';
$route['school/developer/index.html'] = 'developer/index';

// ニュース
// For News
$route['school/news/'] = 'news/index';
$route['school/news/index.html'] = 'news/index';
$route['school/news/post_:num.html'] = 'news/detail/$1';

// お問い合わせ
// For contact
$route['contact/']                = 'contact/index';
$route['contact/index.html']      = 'contact/index';
$route['contact/confirm.html']    = 'contact/confirm';
$route['contact/error.html']      = 'contact/error';
$route['contact/result.html']     = 'contact/result';

// For Company
$route['school/company'] = 'company/index';
$route['school/company/index.html'] = 'company/index';

// For Privacy
$route['school/privacy'] = 'privacy/index';
$route['school/privacy/index.html'] = 'privacy/index';

// For Sitemap
$route['school/sitemap'] = 'sitemap/index';
$route['school/sitemap/index.html'] = 'sitemap/index';

/* End of file routes.php */
