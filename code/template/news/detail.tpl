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
            <div class="badgeBasic01 badgeBasic01Small badgeBasic01#356FBF">{{ $page.data.category|feggCategoryLabel:'news' }}</div>
        </div>
        <div class="ttl">{{ $page.data.title }}</div>
        <div class="content">{{ $page.data.content|noescape }}</div>
        <div class="pagination">
            <div class="list">
                <a href="{{ base }}" class="item">
                    Prev
                </a>
                <a href="." class="item">
                    一覧へ戻る
                </a>
                <a href="" class="item">
                    Next
                </a>
            </div>
        </div>
    </div>
</section>


{{ end section contents }}