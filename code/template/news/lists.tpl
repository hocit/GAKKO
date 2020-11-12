{{ assign $site.title = 'ニュース | ' . $site.title }}
{{ assign $site.description = 'ニュース | ' . $site.description }}
{{ assign $site.url = 'news/' }}

{{ include './include/head/lists' }}

{{ transclude '../template/siteframe' }}

{{ section contents }}

<div class="c-headline">
    <div class="u-layout">
        <h1 class="c-headline__text">ニュース</h1>
        <p class="c-headline__catch">News</p>
    </div>
</div>

<div class="c-topic-path">
    <div class="u-layout">
        <ul class="c-topic-path__row">
            <li class="c-topic-path__col"><a href="{{ base }}/">ホーム</a></li>
            <li class="c-topic-path__col"><span>ニュース</span></li>
        </ul>
    </div>
</div>

<div class="u-layout">
    <table class="p-news">
        {{ assign $format = 'Y/m/d' }}
        {{ foreach $page.data as $key => $post }}
        <tr>
            <th class="p-news__head">{{ $post.post_date|feggDate:$format }}</th>
            <td class="p-news__data is-label"><span class="c-label is-{{ $post.category }}">{{ $post.category|feggCategoryLabel:'news' }}</span></td>
            <td class="p-news__data"><a href="./post_{{ $post[ $page.id ] }}.html">{{ $post.title }}</a></td>
        </tr>
        {{ end foreach }}
    </table>

    {{ if $page.pager.page_max > 1 }}
    <ul class="c-pagination">
        {{ if $page.pager.previous_page }}
        <li class="c-pagination__list"><a href="./?p={{ $page.pager.previous_page }}">&lt;</a></li>
        {{ end }}
        {{ loop $i = $page.pager.page_min to $page.pager.page_max }}
        <li class="c-pagination__list">
            {{ if $i == $page.pager.current_page }}
            <span>{{ $i }}</span>
            {{ else }}
            <a href="./?p={{ $i }}">{{ $i }}</a>
            {{ end }}
        </li>
        {{ end }}
        {{ if $page.pager.next_page }}
        <li class="c-pagination__list"><a href="./?p={{ $page.pager.next_page }}">&gt;</a></li>
        {{ end }}
    </ul>
    {{ end }}
</div>

{{ end section contents }}
