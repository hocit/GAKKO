{{ include head 'html_head' }}
{{ transclude '../frame/popframe' }}
{{ section body }}

<div class="l-pop-header">
    <h1 class="c-h1">{{ $page.mode_title }}<small class="c-h1__small"> - {{ $page.mode }}</small></h1>
</div>

<div id="detail-wysiwyg" class="c-image-detail">
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
        <h2 class="c-h2 c-image-detail__operate__head">挿入設定</h2>
        <dl class="c-image-detail__operate__list">
            <dt class="c-image-detail__operate__list__title">画像サイズ</dt>
            <dd class="c-image-detail__operate__list__data">

                <div class="c-image-detail__operate__size">
                    <div class="c-image-detail__operate__size__item">
                        <span class="c-input-group">
                            <label class="c-input-group__item c-input-group__label" for="width">横</label>
                            <input class="c-input-group__item c-input-text c-image-detail__operate__size__input" type="text" id="width" name="width" data-original="{{ $page.data.width }}" value="{{ $page.data.width }}">
                        </span>
                    </div>
                    x
                    <div class="c-image-detail__operate__size__item">
                        <span class="c-input-group">
                            <label class="c-input-group__item c-input-group__label" for="height">縦</label>
                            <input class="c-input-group__item c-input-text c-image-detail__operate__size__input" type="text" id="height" name="height" data-original="{{ $page.data.height }}" value="{{ $page.data.height }}">
                        </span>
                    </div>

                    <span class="c-image-detail__operate__size__switch">
                        <input type="checkbox" name="ratio" id="ratio" value="1" checked class="c-image-detail__operate__size__switch__input">
                        <label for="ratio" class="c-image-detail__operate__size__switch__label">比率保持</label>
                    </span>
                </div>

            </dd>

            <dt class="c-image-detail__operate__list__title">リサイズ/トリミング</dt>
            <dd class="c-image-detail__operate__list__data">
                <select name="trim" id="trim" class="c-input-select is-full">
                    <option value="i">比率を保持してリサイズ</option>
                    <option value="c">比率を保持してリサイズ（足りない部分は透明 or 白に）</option>
                    <option value="f">比率を無視してリサイズ</option>
                    <option value="t">トリミング</option>
                </select>
            </dd>

            <dt class="c-image-detail__operate__list__title">トリミング位置</dt>
            <dd class="c-image-detail__operate__list__data">
                <table class="c-image-detail__operate__trim">
                    <tbody class="c-image-detail__operate__trim__tbody">
                        <tr class="c-image-detail__operate__trim__tbody__row">
                            <td class="c-image-detail__operate__trim__tbody__data">
                                <label for="lt" class="c-image-detail__operate__trim__label"><input type="radio" name="pos" id="lt" value="lt"></label>
                            </td>
                            <td class="c-image-detail__operate__trim__tbody__data">
                                <label for="t" class="c-image-detail__operate__trim__label"><input type="radio" name="pos" id="t" value="t"></label>
                            </td>
                            <td class="c-image-detail__operate__trim__tbody__data">
                                <label for="rt" class="c-image-detail__operate__trim__label"><input type="radio" name="pos" id="rt" value="rt"></label>
                            </td>
                        </tr>
                        <tr class="c-image-detail__operate__trim__tbody__row">
                            <td class="c-image-detail__operate__trim__tbody__data">
                                <label for="l" class="c-image-detail__operate__trim__label"><input type="radio" name="pos" id="l" value="l"></label>
                            </td>
                            <td class="c-image-detail__operate__trim__tbody__data">
                                <label for="m" class="c-image-detail__operate__trim__label"><input type="radio" name="pos" id="m" value="m" checked></label>
                            </td>
                            <td class="c-image-detail__operate__trim__tbody__data">
                                <label for="r" class="c-image-detail__operate__trim__label"><input type="radio" name="pos" id="r" value="r"></label>
                            </td>
                        </tr>
                        <tr class="c-image-detail__operate__trim__tbody__row">
                            <td class="c-image-detail__operate__trim__tbody__data">
                                <label for="lb" class="c-image-detail__operate__trim__label"><input type="radio" name="pos" id="lb" value="lb"></label>
                            </td>
                            <td class="c-image-detail__operate__trim__tbody__data">
                                <label for="b" class="c-image-detail__operate__trim__label"><input type="radio" name="pos" id="b" value="b"></label>
                            </td>
                            <td class="c-image-detail__operate__trim__tbody__data">
                                <label for="rb" class="c-image-detail__operate__trim__label"><input type="radio" name="pos" id="rb" value="rb"></label>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </dd>
        </dl>
    </div>
</div>

<div class="c-action-list">
    <div class="c-action-list__item">
        <a class="c-button is-primary choose" data-id="{{ $page.data.image_id }}" data-ckeditor="{{ $session.image_ckeditor }}" data-ckeditor-funcnum="{{ $session.image_ckeditor_funcnum }}" data-updir="{{ $page.up_dir }}%d/%s.jpg" href="#">この画像を選択</a>
    </div>
    <div class="c-action-list__item">
        <a class="c-button is-default" href="{{ $page.prev_link|feggUrlParam:$page.append_query }}">一覧に戻る</a>
    </div>
    <div class="c-action-list__item u-pc-ml-4">
        <a class="c-button is-small is-danger link-alert" href="{{ assign $link = $site.prefix . '/delete/' . $page.data.image_id }}{{ $link|feggUrlParam:$page.append_query }}" data-message="削除してもよろしいですか？">削除</a>
    </div>
</div>

{{ end section body }}

