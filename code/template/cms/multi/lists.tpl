{{ include head 'html_head' }}
{{ transclude '../frame/popframe' }}
{{ section body }}

<div class="l-pop-header">
    <h1 class="c-h1">{{ $page.mode_title }}</h1>
</div>

{{ if $page.pager.number_of_records > 0 }}

    <ul class="c-image-list">
        {{ foreach $page.data as $key => $post }}
        <li class="c-image-list__item">
            <a href="{{ $site.prefix }}/edit/{{ $post[ $page.this_id ] }}" class="c-image-list__anchor">
                <img src="{{ $post[ $page.this_id ]|getImageUrl:180:180 }}" alt="" class="c-image-list__image">
                <span class="c-image-list__label">{{ $post.org_name }}</span>
            </a>
        </li>
        {{ end foreach }}
    </ul>

    {{ if $page.pager.page_max > 1 }}
    <div class="c-pagination">
        <ul class="c-pagination__list">
            {{ if $page.pager.previous_page }}
            <li class="c-pagination__item"><a href="{{ $site.prefix }}?p={{ $page.pager.previous_page }}" class="c-pagination__anchor">&lt;</a></li>
            {{ end }}
            {{ loop $i = $page.pager.page_min to $page.pager.page_max }}
            <li class="c-pagination__item">
                {{ if $i == $page.pager.current_page }}
                <span class="c-pagination__current">{{ $i }}</span>
                {{ else }}
                <a href="{{ $site.prefix }}?p={{ $i }}" class="c-pagination__anchor">{{ $i }}</a>
                {{ end }}
            </li>
            {{ end }}
            {{ if $page.pager.next_page }}
            <li class="c-pagination__item"><a href="{{ $site.prefix }}?p={{ $page.pager.next_page }}" class="c-pagination__anchor">&gt;</a></li>
            {{ end }}
        </ul>
    </div>
    {{ end }}

{{ else }}

    <p class="c-alert is-warning">画像が見つかりませんでした</p>

{{ end }}

<div class="c-action-list">
    <div class="c-action-list__item">
        <a class="c-button is-primary" href="{{ $site.prefix }}/add">新規アップロード</a>
    </div>
    <div class="c-action-list__item">
        <a class="c-button is-default close" href="#">キャンセル</a>
    </div>
</div>

{{ end section body }}

