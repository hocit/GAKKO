{{ transclude 'frame/siteframe' }}

{{ section frame_cont }}
<div class="l-content">
    <div class="c-panel is-small">
        <p class="u-align-center u-mt-3"><img src="{{ $site.cms_dir }}/img/logo.png" alt="" /></p>

        <h1 class="c-h1">ログイン</h1>

        {{ if $page.message }}
        <p class="alert alert-{{ $page.message.type }}">{{ $page.message.cont }}</p>
        {{ end }}

        <form action="{{ $site.cms_dir }}/login/auth" method="post">
            <dl class="u-mb-3">
                <dt>ユーザID</dt>
                <dd><input name="login" type="text" class="c-input-text is-full"></dd>
                <dt class="u-mt-1">パスワード</dt>
                <dd><input name="pass" type="password" class="c-input-text is-full"></dd>
            </dl>
            <ul class="u-align-center">
                <input type="submit" value="ログイン" class="c-button is-primary" />
            </ul>
        </form>
    </div>
</div>
{{ end section frame_cont }}
