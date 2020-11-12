{{ transclude 'sitewire' }}
{{ section frame_cont }}

<header class="l-header">
    <div class="l-header__inner">
        <div class="l-header__nav u-sp-only">
            <button id="side-toggle" class="l-header__toggle">
                <span class="l-header__toggle__line"></span>
                <span class="l-header__toggle__line"></span>
                <span class="l-header__toggle__line"></span>
            </button>
        </div>

        <div class="l-header__nav is-pull-right">
            {{ if ! $page.isNotLogin }}
            <a href="{{ base }}/" target="_blank" class="l-header__nav__anchor">サイトを確認</a>
            <a href="{{ $site.cms_dir }}/logout" class="l-header__nav__anchor">ログアウト</a>
            {{ else }}
            <a href="{{ base }}/" target="_blank" class="l-header__nav__anchor">サイトを確認</a>
            {{ end }}
        </div>
    </div>
</header>
<div class="l-content">
    <div class="l-content__main">
        {{ section body }}
        {{ end section body }}
    </div>
    <div class="l-content__side">
        <h1 class="l-content__side__logo"><a href="{{ $site.cms_dir }}" class="l-content__side__logo__anchor"><img src="{{ $site.cms_dir }}/img/logo.png" alt="" class="l-content__side__logo__image" /></a></h1>

        <div class="l-nav">
            {{ assign $menuCls = 'News' }}
            <p class="l-nav__head{{ $className|feggCheck:$menuCls:' is-active' }}">ニュース</p>
            <ul class="l-nav__list">
                {{ assign $menuMode = 'list' }}
                <li class="l-nav__list__item"><a class="l-nav__list__anchor{{ code checkMenuAction( $menuCls, $menuMode ) }}" href="{{ $site.cms_dir }}/{{ $menuCls|strtolower }}">一覧 <i class="fa fa-angle-right l-nav__list__icon"></i></a></li>
                {{ assign $menuMode = 'add' }}
                <li class="l-nav__list__item"><a class="l-nav__list__anchor{{ code checkMenuAction( $menuCls, $menuMode ) }}" href="{{ $site.cms_dir }}/{{ $menuCls|strtolower }}/add">新規追加 <i class="fa fa-angle-right l-nav__list__icon"></i></a></li>
            </ul>
        </div>
    </div>
</div>

{{ end section frame_cont }}
