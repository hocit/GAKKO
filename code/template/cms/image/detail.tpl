{{ include head 'html_head' }}
{{ transclude '../frame/popframe' }}
{{ section body }}

<div class="l-pop-header">
    <h1 class="c-h1">{{ $page.mode_title }}<small class="c-h1__small"> - {{ $page.mode }}</small></h1>
</div>

<div class="c-image-detail">
    <div class="c-image-detail__image">
        <p class="u-align-center">
            <img src="{{ $page.data.image_id|getImageUrl:780:360 }}" alt="" class="u-image-contain">
        </p>
    </div>
    <div class="c-image-detail__operate">
        <h2 class="c-h2 c-image-detail__operate__head">基本情報</h2>
        <div class="c-image-detail__operate__info">
            <table class="c-image-detail__operate__table">
                <tbody class="c-image-detail__operate__table__tbody">
                    <tr class="c-image-detail__operate__table__tbody__row">
                        <th class="c-image-detail__operate__table__tbody__head">元ファイル名</th>
                        <td class="c-image-detail__operate__table__tbody__data">{{ $page.data.org_name }}</td>
                    </tr>
                    <tr class="c-image-detail__operate__table__tbody__row">
                        <th class="c-image-detail__operate__table__tbody__head">画像サイズ</th>
                        <td class="c-image-detail__operate__table__tbody__data">{{ $page.data.width }} x {{ $page.data.height }}</td>
                    </tr>
                    <tr class="c-image-detail__operate__table__tbody__row">
                        <th class="c-image-detail__operate__table__tbody__head">ファイルサイズ</th>
                        <td class="c-image-detail__operate__table__tbody__data">{{ $page.data.size|byteConvert }}</td>
                    </tr>
                    <tr class="c-image-detail__operate__table__tbody__row">
                        <th class="c-image-detail__operate__table__tbody__head">アップロード日時</th>
                        {{ assign $format = 'Y/m/d H:i:s' }}
                        <td class="c-image-detail__operate__table__tbody__data">{{ $page.data.up_time|feggDate:$format }}</td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>

<div class="c-action-list">
    <div class="c-action-list__item">
        <a class="c-button is-primary choose" data-id="{{ $page.data.image_id }}" data-url="{{ $page.data.image_id|getImageUrl }}" href="#">この画像を選択</a>
    </div>
    <div class="c-action-list__item">
        <a class="c-button is-default" href="{{ $page.prev_link|feggUrlParam:$page.append_query }}">一覧に戻る</a>
    </div>
    <div class="c-action-list__item u-pc-ml-4">
        <a class="c-button is-small is-danger link-alert" href="{{ assign $link = $site.prefix . '/delete/' . $page.data.image_id }}{{ $link|feggUrlParam:$page.append_query }}" data-message="削除してもよろしいですか？">削除</a>
    </div>
</div>

{{ end section body }}

