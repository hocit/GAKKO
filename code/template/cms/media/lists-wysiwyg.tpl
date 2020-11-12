{{ include head 'html_head' }}
{{ transclude '../frame/popframe' }}
{{ section body }}

<div class="l-pop-header">
    <h1 class="c-h1">{{ $page.mode_title }}<small class="c-h1__small"> - {{ $page.mode }}</small></h1>
</div>

{{ if $page.message }}
<p class="c-alert is-{{ $page.message.type }}">{{ $page.message.cont }}</p>
{{ end }}

{{ if $page.pager.number_of_records > 0 }}

    <table class="c-table-list">
        <thead class="c-table-list__thead">
            <tr class="c-table-list__thead__row">
                <th class="c-table-list__thead__head">ファイル名</th>
                <th class="c-table-list__thead__head">ファイルサイズ</th>
                <th class="c-table-list__thead__head">操作</th>
            </tr>
        </thead>
        <tbody class="c-table-list__tbody">
            {{ foreach $page.data as $key => $post }}
            <tr class="c-table-list__tbody__row">
                <th class="c-table-list__tbody__head"><a href="{{ $post.file_id|getFileUrl }}" target="_blank">{{ $post.org_name }}</a></th>
                <td class="c-table-list__tbody__data">{{ $post.size|byteConvert }}</td>
                <td class="c-table-list__tbody__data is-action">
                    <a class="c-button is-primary is-small choose" data-id="{{ $post.file_id }}" data-url="{{ $post.file_id|getFileUrl }}" data-ckeditor="{{ $session.image_ckeditor }}" data-ckeditor-funcnum="{{ $session.image_ckeditor_funcnum }}" href="#">選択</a>
                    <a class="c-button is-small is-danger link-alert" href="{{ assign $link = $site.prefix . '/delete/' . $post[$page.this_id] }}{{ $link|feggUrlParam:$page.append_query }}" data-message="削除してもよろしいですか？">削除</a>
                </td>
            </tr>
            {{ end foreach }}
        </tbody>
    </table>

    {{ if $page.pager.page_max > 1 }}
    <div class="c-pagination">
        <ul class="c-pagination__list">
            {{ if $page.pager.previous_page }}
            <li class="c-pagination__item"><a href="{{ assign $page.append_query.p = $page.pager.previous_page }}{{ $site.prefix|feggUrlParam:$page.append_query }}" class="c-pagination__anchor">&lt;</a></li>
            {{ end }}
            {{ loop $i = $page.pager.page_min to $page.pager.page_max }}
            <li class="c-pagination__item">
                {{ if $i == $page.pager.current_page }}
                <span class="c-pagination__current">{{ $i }}</span>
                {{ else }}
                <a href="{{ assign $page.append_query.p = $i }}{{ $site.prefix|feggUrlParam:$page.append_query }}" class="c-pagination__anchor">{{ $i }}</a>
                {{ end }}
            </li>
            {{ end }}
            {{ if $page.pager.next_page }}
            <li class="c-pagination__item"><a href="{{ assign $page.append_query.p = $page.pager.next_page }}{{ $site.prefix|feggUrlParam:$page.append_query }}" class='c-pagination__anchor'>&gt;</a></li>
            {{ end }}
        </ul>
    </div>
    {{ end }}

{{ else }}

    <p class="c-alert is-warning">投稿されているファイルはありません</p>

{{ end }}

<div class="c-action-list">
    <div class="c-action-list__item">
        <a class="c-button is-primary" href="{{ assign $link = $site.prefix . '/add' }}{{ $link|feggUrlParam:$page.append_query }}">新規アップロード</a>
    </div>
    <div class="c-action-list__item">
        <a class="c-button is-default close" href="#">キャンセル</a>
    </div>
</div>

{{ end section body }}

