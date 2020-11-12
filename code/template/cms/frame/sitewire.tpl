<!DOCTYPE html>
<html lang="ja">
    <head>
        <meta charset="UTF-8">
        <title>{{ $site.title }}</title>
        <meta name="viewport" content="width=device-width">
        <link rel="stylesheet" type="text/css" href="{{ $site.cms_dir }}/fonts/font-awesome.min.css" />
        <link rel="stylesheet" type="text/css" href="{{ $site.cms_dir }}/css/base.css" />
        <link rel="stylesheet" type="text/css" href="{{ $site.cms_dir }}/css/unique.css" />

        <script type="text/javascript" src="{{ $site.cms_dir }}/js/jquery.js"></script>
        <script type="text/javascript" src="{{ $site.cms_dir }}/js/base.js"></script>

        {{ head }}
    </head>
    <body>
        <div class="l-wrap">
            {{ section frame_cont }}
            {{ end section frame_cont }}
        </div>
    </body>
</html>
