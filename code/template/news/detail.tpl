{{ assign $site.title = $page.data.title . ' | ニュース | ' . $site.title }}
{{ assign $site.description = $page.data.title . ' | ニュース | ' . $site.description }}
{{ assign $site.url = 'school/news/detail_' . $page.data[$page.id] . '.html' }}
{{ assign $footer_type = 'type_1' }}

{{ transclude '../template/siteframe' }}

{{ include head '../include/head/index' }}
{{ include foot '../include/foot/index' }}


{{ section contents }}


<section class="secBasic01 secBasic01news">
    <div class="container">
        <div class="txt">
            <h1 class="title">スクールニュース</h1>
            <div class="subtitle">SCHOOL NEWS</div>
        </div>
    </div>
</section>

<section class="secBasic03">
    <div class="container">
        <div class="list">
            <a href="/" class="item link">TOP</a>
            <div class="item link icon">
                <svg xmlns="http://www.w3.org/2000/svg" width="5.2" height="7.399" viewBox="0 0 5.2 7.399">
                    <path id="Path_44" data-name="Path 44" d="M9291.7,7842.992l4,3-4,3"
                        transform="translate(-9290.999 -7842.292)" fill="none" stroke="#356fbf" stroke-linecap="round"
                        stroke-linejoin="round" stroke-width="1"></path>
                </svg>
            </div>
            <a href="#" class="item link">スクール事業</a>
            <div class="item link icon">
                <svg xmlns="http://www.w3.org/2000/svg" width="5.2" height="7.399" viewBox="0 0 5.2 7.399">
                    <path id="Path_44" data-name="Path 44" d="M9291.7,7842.992l4,3-4,3"
                        transform="translate(-9290.999 -7842.292)" fill="none" stroke="#356fbf" stroke-linecap="round"
                        stroke-linejoin="round" stroke-width="1"></path>
                </svg>
            </div>
            <div class="item">スクールニュース</div>
        </div>
    </div>
</section>

<section class="secDetail01 secDetail01aa">
    <div class="container">
        <div class="meta">
            {{ assign $format = 'Y.m.d' }}
            <div class="date">{{ $page.data.post_date|feggDate:$format }}</div>
            {{ if $post.category === 'yinyama_style_scola_premiere' }}
                <div class="badge badgeBasic01 badgeBasic01Small  badgeBasic01#356FBF">{{ $page.data.category|feggCategoryLabel:'news' }}</div>
                {{ elseif $post.category === 'mpi_english_club' }}
                <div class="badge badgeBasic01 badgeBasic01Small  badgeBasic01#E57AC0">{{ $page.data.category|feggCategoryLabel:'news' }}</div>
                {{ elseif $post.category === 'other' }}
                <div class="badge badgeBasic01 badgeBasic01Small  badgeBasic01#848484">{{ $page.data.category|feggCategoryLabel:'news' }}</div>
                {{ elseif $post.category === 'ploglab' }}
                <div class="badge badgeBasic01 badgeBasic01Small  badgeBasic01#F0BB1C">{{ $page.data.category|feggCategoryLabel:'news' }}</div>
                {{ end }}
        </div>
        <div class="ttl">{{ $page.data.title }}</div>
        <div class="content">{{ $page.data.content|noescape }}</div>
        <div class="pagination">
            <div class="list">
                {{ if isset($page.prev.news_id) }}
                <a href="{{ base }}/school/news/detail_{{ $page.prev.news_id }}.html" class="item">
                    Prev
                </a>
                {{ end }}
                <a href="{{ base }}/{{ $menu_info['news'] }}" class="item">
                    一覧へ戻る
                </a>
                {{ if isset($page.next.news_id) }}
                <a href="{{ base }}/school/news/detail_{{ $page.next.news_id }}.html" class="item">
                    Next
                </a>
                {{ end }}
            </div>
        </div>
    </div>
</section>


{{ end section contents }}