<!DOCTYPE html>
<html lang="ja">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
    <title>{{ $site.title }}</title>
    <meta name="description" content="{{ $site.description }}">
    <meta name="keywords" content="{{ $site.keywords }}">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link rel="canonical" href="{{ $define.FEGG_HTTP_DOMAIN }}/{{ $site.url }}">
<meta name="robots" content="noindex">

    <!-- OGP -->
    <meta property="og:title" content="{{ $site.title }}">
    <meta property="og:type" content="{{ $site.type }}">
    <meta property="og:url" content="{{ $define.FEGG_HTTP_DOMAIN }}/{{ $site.url }}">
    <meta property="og:description" content="{{ $site.description }}">
    <meta property="og:site_name" content="{{ $site.name }}">
    {{ if $site.image }}
    <meta property="og:image" content="{{ $define.FEGG_HTTP_DOMAIN }}/{{ $site.image }}">
    {{ end }}
    <!-- /OGP -->

    {{ if $site.twitter }}
    <!-- Twitter card -->
    <meta name="twitter:card" content="summary_large_image">
    <meta name="twitter:site" content="@{{ $site.twitter }}">
    <meta name="twitter:title" content="{{ $site.title }}">
    <meta name="twitter:description" content="{{ $site.description }}">
    <meta name="twitter:image" content="{{ $site.image }}">
    <!-- /Twitter card -->
    {{ end }}

    <!-- Disabled Auto link TelNo -->
    <meta name="format-detection" content="telephone=no">

    <link href="https://fonts.googleapis.com/css2?family=Noto+Serif+JP:wght@300;400;500;600;700&display=swap"
        rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:wght@400;600;700&display=swap"
        rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Cardo&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="{{ base }}/data/css/styles.css?v={{ $site.version }}">
</head>

<body>
    {{ code $menu_info = feggMenus() }}
    {{ head }}

    {{ section contents }}
    {{ end section contents }}

    {{ foot }}

    <script src="{{ base }}/js/jquery.js"></script>
    <script src="{{ base }}/js/script.js"></script>
</body>

</html>