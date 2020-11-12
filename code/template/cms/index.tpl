{{ transclude 'frame/siteframe' }}
{{ section body }}

<h1 class="c-h1">管理画面トップ</h1>

<div class="p-dashboard">
    <ul class="p-dashboard__list">
        <li class="p-dashboard__list__item"><a class="p-dashboard__list__button c-button is-default is-block" href="{{ base }}/{{ $page.prefix }}news">ニュース</a></li>
        <li class="p-dashboard__list__blank"></li>
        <li class="p-dashboard__list__item"><a class="p-dashboard__list__button c-button is-default is-block" href="{{ base }}/{{ $page.prefix }}logout">ログアウト</a></li>
    </ul>
</div>

{{ end section body }}
