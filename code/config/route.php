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
$route['school/news/detail_:num.html'] = 'news/detail/$1';

// お問い合わせ
// For contact
$route['school/schola/contact/']                = 'contact/index';
$route['school/schola/contact/index.html']      = 'contact/index';
$route['school/schola/contact/confirm.html']    = 'contact/confirm';
$route['school/schola/contact/error.html']      = 'contact/error';
$route['school/schola/contact/result.html']     = 'contact/result';

// For Company
$route['company'] = 'company/index';
$route['company/index.html'] = 'company/index';

// For Privacy
$route['privacy'] = 'privacy/index';
$route['privacy/index.html'] = 'privacy/index';

// For Sitemap
$route['sitemap'] = 'sitemap/index';
$route['sitemap/index.html'] = 'sitemap/index';

/* End of file routes.php */
