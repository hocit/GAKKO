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

    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link
        href="https://fonts.googleapis.com/css2?family=Cardo&family=Cormorant+Garamond:wght@400;600;700&family=Noto+Sans+JP:wght@300;400;500;700&display=swap"
        rel="stylesheet">
    <link rel="stylesheet" href="{{ base }}/data/css/styles.css?v={{ $site.version }}">
    <link rel="stylesheet" href="{{ base }}/data/css/animate.min.css">
</head>

<body>
    {{ code $menu_info = feggMenus() }}
    {{ head }}

    {{ section contents }}
    {{ end section contents }}

    {{ foot }}

    <script src='https://code.jquery.com/jquery-2.1.3.js'></script>
    <script src='https://cdn.jsdelivr.net/gh/guillaumepotier/Parsley.js@2.9.2/dist/parsley.js'></script>
    <script src="{{ base }}/data/js/script.js"></script>
    <script type="text/javascript">
        $(function () {
            $('#contact-form').parsley();
        });
    </script>
</body>

</html>