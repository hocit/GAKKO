{{ assign $site.title = 'スクールニュース | ' . $site.title }}
{{ assign $site.description = 'SCHOOL NEWS| ' . $site.description }}
{{ assign $site.url = 'school/news/' }}

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
            <a href="" class="item link">TOP</a>
            <div class="item link icon">
                <svg xmlns="http://www.w3.org/2000/svg" width="5.2" height="7.399" viewBox="0 0 5.2 7.399">
                    <path id="Path_44" data-name="Path 44" d="M9291.7,7842.992l4,3-4,3"
                        transform="translate(-9290.999 -7842.292)" fill="none" stroke="#356fbf" stroke-linecap="round"
                        stroke-linejoin="round" stroke-width="1"></path>
                </svg>
            </div>
            <a href="" class="item link">スクール事業</a>
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

<section class="secBasic02 secBasic02school">
    <div class="container">
        <div class="list">
            {{ assign $format = 'Y/m/d' }}
            {{ foreach $page.data as $key => $post }}
            <a href="./post_{{ $post[ $page.id ] }}.html" class="item">
                <div class="date">{{ $post.post_date|feggDate:$format }}</div>
                <div class="badge badgeBasic01 badgeBasic01#356FBF">{{ $post.category|feggCategoryLabel:'news' }}</div>
                <div class="title">{{ $post.title }}</div>
            </a>
            {{ end foreach }}
        </div>
        <div class="pagination">
            <div class="list">
                <a href="" class="item">
                    Prev
                </a>
                <a href="" class="item">
                    1
                </a>
                <a href="" class="item">
                    2
                </a>
                <a href="" class="item">
                    3
                </a>
                <a href="" class="item itemActive">
                    4
                </a>
                <a href="" class="item">
                    …
                </a>
                <a href="" class="item">
                    8
                </a>
                <a href="" class="item">
                    Next
                </a>
            </div>
        </div>
    </div>
</section>


{{ end section contents }}