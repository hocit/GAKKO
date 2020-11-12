{{ assign $site.is_index = true }}

{{ transclude './template/siteframe' }}

{{ include head './include/head/index' }}
{{ include foot './include/foot/index' }}

{{ section contents }}


<div class="p-index__slider">
    <ul>
        <li class="p-index__slider__slide">
            <picture>
                <source media="{{ $site.picture.pc }}" srcset="https://dummyimage.com/1200x600/000/fff">
                <source media="{{ $site.picture.sp }}" srcset="https://dummyimage.com/640x720/000/fff">
                <img class="u-image-full" src="https://dummyimage.com/1200x600/000/fff" alt="">
            </picture>
        </li>
    </ul>
</div>

<div class="u-layout">
    <div class="p-index__service">
        <ul class="u-pc-flex u-pc-flex-justify-space-between">
            <li class="p-index__service__col"><a class="p-index__service__button" href="#">サービス01</a></li>
            <li class="p-index__service__col"><a class="p-index__service__button" href="#">サービス02</a></li>
            <li class="p-index__service__col"><a class="p-index__service__button" href="#">サービス03</a></li>
        </ul>
    </div>

    <div class="u-pc-flex u-pc-flex-justify-space-between u-pc-flex-align-flex-start">
        <section class="p-index__news">
            <div class="p-index__news__head-group">
                <h2 class="p-index__news__head">ニュース</h2>
                <p class="p-index__news__button"><a href="./news/" class="c-button is-small">一覧を見る</a></p>
            </div>
            <table class="p-index__news__table">
                {{ assign $format = 'Y/m/d' }}
                {{ foreach $page.news as $key => $post }}
                <tr>
                    <th class="p-index__news__table__head">{{ $post.post_date|feggDate:$format }}</th>
                    <td class="p-index__news__table__data is-label"><span class="c-label is-{{ $post.category }}">{{ $post.category|feggCategoryLabel:'news' }}</span></td>
                    <td class="p-index__news__table__data"><a href="./news/post_{{ $post[ $page.id ] }}.html">{{ $post.title }}</a></td>
                </tr>
                {{ end foreach }}
            </table>
        </section>
        <div class="p-index__banner">
            <ul>
                <li class="p-index__banner__col"><a class="p-index__banner__button" href="#">会社案内</a></li>
                <li class="p-index__banner__col"><a class="p-index__banner__button" href="#">採用情報</a></li>
                <li class="p-index__banner__col"><a class="p-index__banner__button" href="#">よくある質問</a></li>
            </ul>
        </div>
    </div>
</div>


{{ end section contents }}
