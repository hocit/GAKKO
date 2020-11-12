{{ assign $site.title = $page.data.title . ' | ニュース | ' . $site.title }}
{{ assign $site.description = $page.data.title . ' | ニュース | ' . $site.description }}
{{ assign $site.url = 'news/post_' . $page.data[$page.id] . '.html' }}

{{ include './include/head/detail' }}

{{ transclude '../template/siteframe' }}

{{ section contents }}

<div class="c-headline">
    <div class="u-layout">
        <p class="c-headline__text">ニュース</p>
        <p class="c-headline__catch">News</p>
    </div>
</div>

<div class="c-topic-path">
    <div class="u-layout">
        <ul class="c-topic-path__row">
            <li class="c-topic-path__col"><a href="{{ base }}/">ホーム</a></li>
            <li class="c-topic-path__col"><a href="{{ base }}/news/">ニュース</a></li>
            <li class="c-topic-path__col"><span>{{ $page.data.title }}</span></li>
        </ul>
    </div>
</div>

<div class="u-layout">

    <div class="p-news-detail">
        <section>
            {{ assign $format = 'Y/m/d' }}
            <p class="p-news-detail__meta">
                <span class="p-news-detail__meta__item">{{ $page.data.post_date|feggDate:$format }}</span>
                <span class="p-news-detail__meta__item c-label is-{{ $page.data.category }}">{{ $page.data.category|feggCategoryLabel:'news' }}</span>
            </p>
            <h1 class="p-news-detail__title">{{ $page.data.title }}</h1>

            {{ if $page.data.image_id }}
            <div class="">
                <p class="p-news-detail__photo"><img class="u-image__contain" src="{{ $page.data.image_id|getImageUrl }}"></p>
                <div class="p-news-detail__text c-entry-block">
                    {{ $page.data.content|noescape }}
                </div>
            </div>
            {{ else }}
            <div class="c-entry-block">
                {{ $page.data.content|noescape }}
            </div>
            {{ end }}

            {{ if $page.data.file_id }}
            <p class="p-news-detail__file"><a class="c-button" href="{{ $page.data.file_id|getFileUrl }}">ファイル</a></p>
            {{ end }}
        </section>

        <p class="p-news-detail__back"><a class="c-button" href="./">&lt; 一覧へ戻る</a></p>
    </div>
</div>

{{ end section contents }}
