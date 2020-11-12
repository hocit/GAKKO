{{ include head 'html_head' }}
{{ transclude '../frame/popframe' }}
{{ section body }}

<div class="l-pop-header">
    <h1 class="c-h1">{{ $page.mode_title }}<small class="c-h1__small"> - {{ $page.mode }}</small></h1>
</div>

{{ if $page.error }}
<p class="c-alert is-danger">{{ $page.error|noescape }}</p>
{{ end }}

<div class="c-alert is-default">
    <ul>
        <li>最大ファイルサイズは{{ $page.max_file_size }}です。<br>
            <small class="text-red">※ただし、1MB以内に落としていただくコトを推奨しています。</small></li>
        <li>ファイル形式は、PDF・MS Office・Zip圧縮ファイルに対応しています。</li>
    </ul>
</div>

<form action="{{ assign $link = $site.prefix . '/update' }}{{ $link|feggUrlParam:$page.append_query }}" class="form_box inputForm" method="post" enctype="multipart/form-data">
    <p class="u-align-center u-mb-2"><input type="file" name="file"></p>
    <p class="u-align-center"><input type="submit" value="アップロード" class="c-button is-primary" /></p>
    {{ hidden }}
</form>

<div class="c-action-list">
    <div class="c-action-list__item">
        <a class="c-button is-primary" href="{{ $site.prefix|feggUrlParam:$page.append_query }}">新規アップロード</a>
    </div>
    <div class="c-action-list__item">
        <a class="c-button is-default close" href="#">キャンセル</a>
    </div>
</div>

{{ end section body }}

