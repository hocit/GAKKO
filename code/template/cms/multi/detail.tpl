{{ include head 'html_head' }}
{{ transclude '../frame/popframe' }}
{{ section body }}

<div class="l-pop-header">
    <h1 class="c-h1">{{ $page.mode_title }}</h1>
</div>

<p class="u-align-center">
    <img src="{{ $page.data.image_id|getImageUrl:780:360 }}" alt="">
</p>

<div class="c-action-list">
    <div class="c-action-list__item">
        <a class="c-button is-primary choose" data-id="{{ $page.data.image_id }}" data-url="{{ $page.data.image_id|getImageUrl:320 }}" href="#">この画像を選択</a>
    </div>
    <div class="c-action-list__item">
        <a class="c-button is-default" href="{{ $page.prev_link }}">一覧に戻る</a>
    </div>
    <div class="c-action-list__item u-pc-ml-4">
        <a class="c-button is-small is-danger link-alert" href="{{ $site.prefix }}/delete/{{ $page.data.image_id }}" data-message="削除してもよろしいですか？">削除</a>
    </div>
</div>

{{ end section body }}

