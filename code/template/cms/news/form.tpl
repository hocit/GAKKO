{{ include head 'html_head' }}
{{ transclude '../frame/siteframe' }}
{{ section body }}

<h1 class="c-h1">{{ $page.mode_title }}<small class="c-h1__small"> - {{ $page.mode }}</small></h1>

{{ if $page.message }}
<p class="c-alert is-{{ $page.message.type }}">{{ $page.message.cont }} <a href="{{ $page.prev_link }}" class="c-button is-small is-{{ $page.message.type }}">一覧に戻る</a></p>
{{ end }}

<form action="{{ $site.prefix }}/update" class="form_box inputForm" method="post">

    {{if isset($page.error)}}
    <div class="c-alert is-danger">
        <h2 class="c-alert__header">入力された内容を登録できない項目があります</h2>
        <ul>
            {{ foreach $page.error as $key => $value }}
            <li>{{ $value|noescape }}</li>
            {{ end }}
        </ul>
    </div>
    {{end}}

    <fieldset class="c-fieldset">
        <legend class="c-fieldset__legend">情報入力</legend>

        <table class="c-table-form">
            <tbody class="c-table-form__tbody">

                {{ assign $id = "visible" }}
                {{ assign $param = 1 }}
                <tr class="c-table-form__tbody__row">
                    <th class="c-table-form__tbody__head">表示／非表示</th>
                    <td class="c-table-form__tbody__data">
                        <input type="hidden" name="{{ $id }}" value="0">
                        <label class="c-input-label"><input type="checkbox" name="{{ $id }}" value="1"{{ checked key=$param value=$page.data[$id] }} /> 表示する</label>
                    </td>
                </tr>

                {{ assign $id = "post_date" }}
                {{ assign $format = "Y/m/d H:i" }}
                <tr class="c-table-form__tbody__row">
                    <th class="c-table-form__tbody__head">投稿日 <span class="c-required">※</span></th>
                    <td class="c-table-form__tbody__data"><input type="text" name="{{ $id }}" class="c-input-text datepick" value="{{ $page.data[$id]|feggDate:$format }}"></td>
                </tr>

                {{ assign $id = "title" }}
                <tr class="c-table-form__tbody__row">
                    <th class="c-table-form__tbody__head">タイトル <span class="c-required">※</span></th>
                    <td class="c-table-form__tbody__data"><input type="text" name="{{ $id }}" class="c-input-text is-full" value="{{ $page.data[$id] }}"></td>
                </tr>

                {{ assign $id = "category" }}
                {{ code $categories = feggCategories('news') }}
                <tr class="c-table-form__tbody__row">
                    <th class="c-table-form__tbody__head">カテゴリー <span class="c-required">※</span></th>
                    <td class="c-table-form__tbody__data">
                        {{ foreach $categories as $key => $label }}
                        <label class="c-input-label"><input type="radio" name="{{ $id }}" value="{{ $key }}"{{ checked key=$key value=$page.data[$id] }} /> {{ $label }}</label>
                        {{ end foreach }}
                    </td>
                </tr>
            </tbody>
        </table>
    </fieldset>

    <fieldset class="c-fieldset">
        <legend class="c-fieldset__legend">記事内容</legend>

        <table class="c-table-form">
            <tbody class="c-table-form__tbody">

                {{ assign $id = "content" }}
                <tr class="c-table-form__tbody__row is-top">
                    <th class="c-table-form__tbody__head">本文</th>
                    <td class="c-table-form__tbody__data"><textarea type="text" name="{{ $id }}" rows="10" class="c-input-text is-full">{{ $page.data[$id]|noescape }}</textarea></td>
                </tr>

                {{ assign $id = "image_id" }}
                <tr class="c-table-form__tbody__row is-top">
                    <th class="c-table-form__tbody__head">メイン画像</th>
                    <td class="c-table-form__tbody__data">
                        <div class="c-uploader-image">
                            <input class="img_val" type="hidden" name="{{ $id }}" value="{{ $page.data[$id] }}" />
                            <div class="c-uploader-image__content">
                                <div class="c-uploader-image__selected">
                                    <div class="c-uploader-image__photo">
                                        <figure class="c-uploader-image__photo__figure">
                                            {{ if isset( $page.data[$id] ) && $page.data[$id] }}
                                            <img src="{{ $page.data[$id]|getImageUrl }}" alt="" class="c-uploader-image__photo__image">
                                            {{ end }}
                                        </figure>
                                    </div>
                                    <a href="#" class="delete_image c-button is-small is-danger">選択解除</a>
                                    <a href="{{ $site.cms_dir }}/image/add" class="change_image c-button is-small is-success modal_image">別の画像を選択</a>
                                </div>
                                <div class="c-uploader-image__empty">
                                    <a href="{{ $site.cms_dir }}/image/add" class="c-button is-primary modal_image">新規アップロード</a>
                                    <a href="{{ $site.cms_dir }}/image" class="c-button is-small is-success modal_image">アップ済みの画像から選択</a>
                                </div>
                            </div>
                        </div>
                    </td>
                </tr>

                {{ assign $id = "file_id" }}
                <tr class="c-table-form__tbody__row is-top">
                    <th class="c-table-form__tbody__head">ファイル</th>
                    <td class="c-table-form__tbody__data">
                        <div class="c-uploader-file">
                            <input class="file_val" type="hidden" name="{{ $id }}" value="{{ $page.data[$id] }}" />
                            <div class="c-uploader-file__content">
                                <div class="c-uploader-file__selected">
                                    <p class="c-uploader-file__file">
                                        {{ if isset( $page.data[$id] ) && $page.data[$id] }}
                                        <a class="c-button is-small is-default" href="{{ $page.data[$id]|getFileUrl }}" target="_blank">プレビュー</a>
                                        {{ end }}
                                    </p>
                                    <a href="#" class="delete_file c-button is-small is-danger">選択解除</a>
                                    <a href="{{ $site.cms_dir }}/media/add" class="change_image c-button is-small is-success modal_file">別のファイルを選択</a>
                                </div>
                                <div class="c-uploader-file__empty">
                                    <a href="{{ $site.cms_dir }}/media/add" class="c-button is-primary modal_file">新規アップロード</a>
                                    <a href="{{ $site.cms_dir }}/media" class="c-button is-small is-success modal_file">アップ済みのファイルから選択</a>
                                </div>
                            </div>
                        </div>
                    </td>
                </tr>
            </tbody>
        </table>
    </fieldset>

    <div class="c-action-list">
        <div class="c-action-list__item">
            <input type="submit" value="登録" class="c-button is-primary" />
        </div>
        <div class="c-action-list__item">
            <a href="{{ $page.prev_link }}" class="c-button is-default">キャンセル</a>
        </div>
    </div>

    {{ hidden }}
</form>

{{ end section body }}
