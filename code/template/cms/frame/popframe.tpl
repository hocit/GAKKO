<!DOCTYPE html>
<html lang="ja">
    <head>
        <meta charset="UTF-8">
        <title>{{ $site.title }}</title>
        <meta name="viewport" content="width=device-width">
        <link rel="stylesheet" type="text/css" href="{{ $site.cms_dir }}/fonts/font-awesome.min.css" />
        <link rel="stylesheet" type="text/css" href="{{ $site.cms_dir }}/css/pop.css" />
        <link rel="stylesheet" type="text/css" href="{{ $site.cms_dir }}/css/unique.css" />

        <script type="text/javascript" src="{{ $site.cms_dir }}/js/jquery.js"></script>
        <script type="text/javascript" src="{{ $site.cms_dir }}/js/base.js"></script>

        {{ head }}
    </head>
    <body>
        <div class="l-wrap">
            <div class="l-pop-content">
                <div class="main_block">
                    {{ section body }}
                    {{ end section body }}
                </div>
            </div>
        </div>
    </body>
</html>
