{{ assign $site.title = 'スクールニュース | ' . $site.title }}
{{ assign $site.description = 'SCHOOL NEWS| ' . $site.description }}
{{ assign $site.url = 'school/news/' }}
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
            <a href="{{ base }}/{{ $menu_info['school'] }}" class="item link">スクール事業</a>
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
            {{ assign $format = 'Y.m.d' }}
            {{ foreach $page.data as $key => $post }}
            <a href="{{ base }}/school/news/detail_{{ $post[ $page.id ] }}.html" class="item">
                <div class="date">{{ $post.post_date|feggDate:$format }}</div>
                {{ if $post.category === 'yinyama_style_scola_premiere' }}
                <div class="badge badgeBasic01 badgeBasic01#356FBF">{{ $post.category|feggCategoryLabel:'news' }}</div>
                {{ elseif $post.category === 'mpi_english_club' }}
                <div class="badge badgeBasic01 badgeBasic01#E57AC0">{{ $post.category|feggCategoryLabel:'news' }}</div>
                {{ elseif $post.category === 'other' }}
                <div class="badge badgeBasic01 badgeBasic01#848484">{{ $post.category|feggCategoryLabel:'news' }}</div>
                {{ elseif $post.category === 'ploglab' }}
                <div class="badge badgeBasic01 badgeBasic01#F0BB1C">{{ $post.category|feggCategoryLabel:'news' }}</div>
                {{ end }}
                {{ code $title = feggExcerpt45('Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.') }}
                <div class="title">{{ $title }}</div>
            </a>
            {{ end foreach }}
        </div>
        {{ if $page.pager.page_max > 1 }}
        <div class="pagination">
            <div class="list">
                {{ if $page.pager.previous_page }}
                <a href="{{ base }}/school/news/?p={{ $page.pager.previous_page }}" class="item">Prev</a>
                {{ end }}
                {{ loop $i = $page.pager.page_min to $page.pager.page_max }}
                {{ if $i == $page.pager.current_page }}
                <a href="{{ base }}/school/news/?p={{ $i }}" class="item itemActive">{{ $i }}</a>
                {{ else }}
                <a href="{{ base }}/school/news/?p={{ $i }}" class="item">{{ $i }}</a>
                {{ end }}
                {{ end }}
                {{ if $page.pager.next_page }}
                <a href="{{ base }}/school/news/?p={{ $page.pager.next_page }}" class="item">Next</a>
                {{ end }}
            </div>
        </div>
        {{ end }}
        
    </div>
</section>


{{ end section contents }}