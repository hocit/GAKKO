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

            </tbody>
        </table>
    </fieldset>

    <fieldset class="c-fieldset">
        <legend class="c-fieldset__legend">ギャラリー画像<small>（最大50枚まで）</small> <a href="{{ $site.cms_dir }}/multi/add" class="c-button is-success is-small modal_multi_image" data-target="#gallery-wrap" data-template="#gallery-template" data-count=".photo_thumb" data-maxsize="50">画像追加</a></legend>

        <div class="c-alert is-default">
            ドラッグ＆ドロップで並び順を変更することが可能です。
        </div>

        {{ assign $gid = "galleries" }}
        <div id="gallery-wrap" class="modal_image_multi_cont c-uploader-list">

            {{ if $page.data.galleries }}
            {{ foreach $page.data.galleries as $key => $gallery }}
            <div class="c-uploader-list__item">
                {{ assign $id = "image_id" }}
                {{ assign $image_id = is_array($gallery) ? $gallery[$id] : $gallery }}
                <div class="c-uploader-image">
                    <input class="img_val" type="hidden" name="{{ $gid }}[]" value="{{ $image_id }}" />
                    <div class="c-uploader-image__content">
                        <div class="c-uploader-image__selected u-align-center">
                            <p class="c-uploader-image__photo u-mh-auto">
                                <figure class="c-uploader-image__photo__figure">
                                    <img src="{{ $image_id|getImageUrl:220:150 }}" alt="" class="c-uploader-image__photo__image">
                                </figure>
                            </p>
                            <a href="#" class="delete_image c-button is-small is-danger">選択解除</a>
                            <a href="{{ $site.cms_dir }}/image/add" class="change_image c-button is-small is-success modal_image">別の画像を選択</a>
                        </div>
                        <div class="c-uploader-image__empty">
                            <p class="c-uploader-image__photo u-mh-auto"></p>
                            <a href="{{ $site.cms_dir }}/image/add" class="c-button is-primary is-small modal_image">新規投稿</a>
                            <a href="{{ $site.cms_dir }}/image" class="bc-buttontn is-success is-small modal_image">既存画像から選択</a>
                        </div>
                    </div>
                </div>
                <div class="u-mt-1">
                    <button class="c-button is-danger is-small is-block list-remove">削除</button>
                </div>
            </div>
            {{ end foreach }}
            {{ end }}

        </div>

        <p class="u-align-center"><a href="{{ $site.cms_dir }}/multi/add" type="button" class="c-button is-block is-success modal_multi_image" data-target="#gallery-wrap" data-template="#gallery-template" data-count=".photo_thumb" data-maxsize="50">画像追加</a></p>

        <script type="text/template" id="gallery-template">
            <div class="c-uploader-list__item">
                <div class="c-uploader-image">
                    <input class="img_val" type="hidden" name="{{ $gid }}[]" value="" />
                    <div class="c-uploader-image__content">
                        <div class="c-uploader-image__selected u-align-center">
                            <div class="c-uploader-image__photo u-mh-auto">
                                <figure class="c-uploader-image__photo__figure"></figure>
                            </div>
                            <a href="#" class="delete_image c-button is-small is-danger">選択解除</a>
                            <a href="{{ $site.cms_dir }}/image/add" class="change_image c-button is-small is-success modal_image">別の画像を選択</a>
                        </div>
                        <div class="c-uploader-image__empty">
                            <div class="c-uploader-image__photo u-mh-auto">
                                <figure class="c-uploader-image__photo__figure"></figure>
                            </div>
                            <a href="{{ $site.cms_dir }}/image/add" class="c-button is-primary is-small modal_image">新規投稿</a>
                            <a href="{{ $site.cms_dir }}/image" class="c-button is-success is-small modal_image">既存画像から選択</a>
                        </div>
                    </div>
                </div>
                <div class="u-mt-1">
                    <button class="c-button is-danger is-small is-block list-remove">削除</button>
                </div>
            </div>
        </script>
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
