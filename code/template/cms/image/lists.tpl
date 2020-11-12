{{ include head 'html_head' }}
{{ transclude '../frame/popframe' }}
{{ section body }}

<div class="l-pop-header">
    <h1 class="c-h1">{{ $page.mode_title }}<small class="c-h1__small"> - {{ $page.mode }}</small></h1>
    <form action="" method="get" class="l-pop-header__right">
        <p class="c-input-group">
            <label class="c-input-group__item c-input-group__label" for="search"><i class="fa fa-search"></i></label>
            <input type="text" name="s" class="c-input-group__item c-input-text" id="search" value="{{ $in.s }}">
            <button class="c-input-group__item c-input-group__button c-button is-default is-small">検索</button>
        </p>
        <input type="hidden" name="from" value="{{ $in.from }}">
    </form>
</div>

{{ if $page.pager.number_of_records > 0 }}

    <ul class="c-image-list">
        {{ foreach $page.data as $key => $post }}
        <li class="c-image-list__item">
            <a href="{{ assign $link = $site.prefix . '/edit/' . $post[ $page.this_id ] }}{{ $link|feggUrlParam:$page.append_query }}" class="c-image-list__anchor">
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
            <li class="c-pagination__item"><a href="{{ assign $page.append_query.p = $page.pager.next_page }}{{ $site.prefix|feggUrlParam:$page.append_query }}" class="c-pagination__anchor">&gt;</a></li>
            {{ end }}
        </ul>
    </div>
    {{ end }}

{{ else }}

    <p class="c-alert is-warning">画像が見つかりませんでした</p>

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

