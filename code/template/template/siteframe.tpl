<!DOCTYPE html>
<html lang="ja">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width">
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

        <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+JP:wght@400;500;700&family=Noto+Serif+JP:wght@400;500;700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="{{ base }}/data/css/style.css?v={{ $site.version }}">

        {{ head }}
    </head>
    <body>
        <header class="l-header">
            <div class="l-header__inner u-layout">
                {{ if $site.is_index }}
                <h1 class="l-header__logo"><a href="{{ base }}/" class="l-header__logo__anchor">会社ロゴ</a></h1>
                {{ else }}
                <p class="l-header__logo"><a href="{{ base }}/" class="l-header__logo__anchor">会社ロゴ</a></p>
                {{ end }}
                <p class="l-header__contact u-pc-only"><a class="c-button" href="{{ base }}/contact/">お問い合わせ</a></p>
            </div>
        </header>
        <nav class="l-nav block">
            <p class="u-sp-only l-nav__trigger">
                <button class="l-nav__trigger__button">
                    <span class="l-nav__trigger__line"></span>
                    <span class="l-nav__trigger__line"></span>
                    <span class="l-nav__trigger__line"></span>
                </button>
            </p>

            <div class="u-pc-layout">
                <ul class="l-nav__content">
                    <li class="l-nav__menu"><a href="{{ base }}/" class="l-nav__menu__anchor">ホーム</a></li>
                    <li class="l-nav__menu"><a href="#" class="l-nav__menu__anchor">会社案内</a></li>
                    <li class="l-nav__menu"><a href="#" class="l-nav__menu__anchor">サービス紹介</a></li>
                    <li class="l-nav__menu"><a href="#" class="l-nav__menu__anchor">採用情報</a></li>
                    <li class="l-nav__menu"><a href="#" class="l-nav__menu__anchor">よくある質問</a></li>
                </ul>
            </div>
        </nav>

        <main class="l-main">
            {{ section contents }}
            {{ end section contents }}
        </main>

        <div class="u-layout">
            <section class="c-contact-banner">
                <p class="c-contact-banner__tel">TEL <a class="u-anchor-tel u-color-text" href="tel:052-937-1811">052-937-1811</a></p>
                <p class="c-contact-banner__time">営業時間 9:00〜18:00<br>月〜金 祝日除く</p>
                <p class="c-contact-banner__btn"><a class="c-button is-block" href="{{ base }}/contact/">メールでのお問い合わせ</a></p>
            </section>
        </div>

        <footer class="l-footer">
            <p class="l-footer__pagetop"><a class="l-footer__pagetop__button" href="#">ページトップ</a></p>

            <div class="l-footer__inner">
                <div class="l-footer__content u-layout">
                    <div class="l-footer__info">
                        <h2 class="l-footer__info__head"><a class="l-footer__info__button" href="{{ base }}/">会社ロゴ</a></h2>
                        <p>
                            〒461-0004<br>
                            名古屋市東区葵1-15-17<br>
                            新栄アミューズビル4F<br>
                            TEL: <a class="u-anchor-tel u-color-text" href="tel:052-937-1811">052-937-1811</a> / FAX 052-937-1821
                        </p>
                    </div>
                    <div class="l-footer__sitemap u-pc-flex u-pc-flex-justify-space-between pc">
                        <ul class="l-footer__sitemap__col">
                            <li class="l-footer__sitemap__menu"><a href="{{ base }}/" class="l-footer__sitemap__anchor">ホーム</a></li>
                            <li class="l-footer__sitemap__menu"><a href="#" class="l-footer__sitemap__anchor">会社案内</a>
                                <ul>
                                    <li><a href="#" class="l-footer__sitemap__anchor is-sub">理念・挨拶</a></li>
                                    <li><a href="#" class="l-footer__sitemap__anchor is-sub">会社概要</a></li>
                                    <li><a href="#" class="l-footer__sitemap__anchor is-sub">アクセス</a></li>
                                </ul>
                            </li>
                        </ul>
                        <ul class="l-footer__sitemap__col">
                            <li class="l-footer__sitemap__menu"><a href="#" class="l-footer__sitemap__anchor">サービス紹介</a>
                                <ul>
                                    <li><a href="#" class="l-footer__sitemap__anchor is-sub">サービス01</a></li>
                                    <li><a href="#" class="l-footer__sitemap__anchor is-sub">サービス02</a></li>
                                    <li><a href="#" class="l-footer__sitemap__anchor is-sub">サービス03</a></li>
                                </ul>
                            </li>
                            <li class="l-footer__sitemap__menu"><a href="#" class="l-footer__sitemap__anchor">よくある質問</a></li>
                        </ul>
                        <ul class="l-footer__sitemap__col">
                            <li class="l-footer__sitemap__menu"><a href="#" class="l-footer__sitemap__anchor">採用情報</a>
                                <ul>
                                    <li><a href="#" class="l-footer__sitemap__anchor is-sub">選考ステップ</a></li>
                                    <li><a href="#" class="l-footer__sitemap__anchor is-sub">募集要項</a></li>
                                    <li><a href="#" class="l-footer__sitemap__anchor is-sub">エントリー</a></li>
                                </ul>
                            </li>
                            <li class="l-footer__sitemap__menu">
                                <ul>
                                    <li><a href="{{ base }}/contact/" class="l-footer__sitemap__anchor is-sub">お問い合わせ</a></li>
                                    <li><a href="#" class="l-footer__sitemap__anchor is-sub">プライバシーポリシー</a></li>
                                    <li><a href="#" class="l-footer__sitemap__anchor is-sub">サイトマップ</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>

            <p class="l-footer__copyright">Copyright COMPANY Co., Ltd. All rights reserved.</p>
        </footer>

        <script type="text/javascript" src="{{ base }}/data/js/common/jquery.min.js?v={{ $site.version }}"></script>
        <script type="text/javascript" src="{{ base }}/data/js/common/jquery.lh.js?v={{ $site.version }}"></script>
        <script type="text/javascript" src="{{ base }}/data/js/common/base.js?v={{ $site.version }}"></script>

        {{ foot }}
    </body>
</html>
