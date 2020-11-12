{{ transclude '../frame/siteframe' }}
{{ section body }}

<h1 class="c-h1">{{ $page.mode_title }} <a href="{{ $site.prefix }}/add" class="c-button is-small is-primary">新規追加</a></h1>

{{ if $page.message }}
<p class="alert alert-{{ $page.message.type }}">{{ $page.message.cont }}</p>
{{ end }}

{{ if $page.pager.number_of_records > 0 }}

    <table class="c-table-list u-mb-2">
        <thead class="c-table-list__thead">
            <tr class="c-table-list__thead__row">
                <th class="c-table-list__thead__head is-visible"></th>
                <th class="c-table-list__thead__head is-thumbnail"></th>
                <th class="c-table-list__thead__head">タイトル</th>
                <th class="c-table-list__thead__head is-date">投稿日</th>
                <th class="c-table-list__thead__head">編集</th>
            </tr>
        </thead>
        <tbody class="c-table-list__tbody">
            {{ foreach $page.data as $key => $post }}
            <tr class="c-table-list__tbody__row">
                <td class="c-table-list__tbody__data">{{ if $post.visible }}<span class="c-label is-success">表示</span>{{ else }}<span class="label label-default">非表示</span>{{ end }}</td>
                <td class="c-table-list__tbody__data">
                    {{ if $post.image_id }}
                    <img src="{{ $post.image_id|getImageUrl:80:80 }}" width="80">
                    {{ end }}
                </td>
                <td class="c-table-list__tbody__data">{{ $post.title }}</td>
                {{ assign $format = 'Y/m/d' }}
                <td class="c-table-list__tbody__data">{{ $post.post_date|feggDate:$format }}</td>
                <td class="c-table-list__tbody__data is-action">
                    <a class="c-button is-micro is-primary" href="{{ $site.prefix }}/edit/{{ $post[ $page.this_id ] }}">編集</a>
                    <a class="c-button is-micro is-default" href="{{ $site.prefix }}/add/copy/{{ $post[ $page.this_id ] }}">複製</a>
                    <a class="c-button is-micro is-danger link-alert" href="{{ $site.prefix }}/delete/{{ $post[ $page.this_id ] }}" data-message="削除してもよろしいですか？">削除</a>
                </td>
            </tr>
            {{ end foreach }}
        </tbody>
    </table>

    {{ if $page.pager.page_max > 1 }}
    <div class="c-pagination">
        <ul class="c-pagination__list">
            {{ if $page.pager.previous_page }}
            <li class="c-pagination__item"><a href="{{ $site.prefix }}?p={{ $page.pager.previous_page }}&{{ code echoSearchQuery() }}" class="c-pagination__anchor">&lt;</a></li>
            {{ end }}
            {{ loop $i = $page.pager.page_min to $page.pager.page_max }}
            <li class="c-pagination__item">
                {{ if $i == $page.pager.current_page }}
                <span class="c-pagination__current">{{ $i }}</span>
                {{ else }}
                <a href="{{ $site.prefix }}?p={{ $i }}&{{ code echoSearchQuery() }}" class="c-pagination__anchor">{{ $i }}</a>
                {{ end }}
            </li>
            {{ end }}
            {{ if $page.pager.next_page }}
            <li class="c-pagination__item"><a href="{{ $site.prefix }}?p={{ $page.pager.next_page }}&{{ code echoSearchQuery() }}" class="c-pagination__anchor">&gt;</a></li>
            {{ end }}
        </ul>
    </div>
    {{ end }}

{{ else }}

    <p class="c-alert is-warning">記事が見つかりませんでした</p>

{{ end }}

<div class="c-action-list">
    <div class="c-action-list__item">
        <a href="{{ $site.prefix }}/add" class="c-button is-primary">新規追加</a>
    </div>
</div>

{{ end section body }}
