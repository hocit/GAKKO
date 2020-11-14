{{ assign $site.title = 'サイトマップ | ' . $site.title }}
{{ assign $site.description = 'SITE MAP | ' . $site.description }}
{{ assign $site.url = 'sitemap/' }}
{{ assign $footer_type = 'type_1' }}

{{ transclude '../template/siteframe' }}

{{ include head '../include/head/index' }}
{{ include foot '../include/foot/index' }}

{{ section contents }}


<section class="secBasic01 secBasic01sitemap">
    <div class="container">
        <div class="txt">
            <h1 class="title">サイトマップ</h1>
            <div class="subtitle">SITE MAP</div>
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
            <div class="item">サイトマップ</div>
        </div>
    </div>
</section>

<section class="secSitemap01 secSitemap01aa">
    <div class="container">
        <div class="grid">
            <div class="col col01">
                <div class="nav">
                    <a href="/" class="item item01">
                        <svg xmlns="http://www.w3.org/2000/svg" width="9.207" height="17.414"
                            viewBox="0 0 9.207 17.414">
                            <path id="Path_44" data-name="Path 44" d="M9291.7,7842.993l8,8-8,8"
                                transform="translate(-9290.992 -7842.286)" fill="none" stroke="#080808"
                                stroke-linecap="round" stroke-linejoin="round" stroke-width="1"></path>
                        </svg>
                        トップページ</a>
                </div>
            </div>
            <div class="col col02">
                <div class="nav">
                    <a href="" class="item item01">
                        <svg xmlns="http://www.w3.org/2000/svg" width="9.207" height="17.414"
                            viewBox="0 0 9.207 17.414">
                            <path id="Path_44" data-name="Path 44" d="M9291.7,7842.993l8,8-8,8"
                                transform="translate(-9290.992 -7842.286)" fill="none" stroke="#080808"
                                stroke-linecap="round" stroke-linejoin="round" stroke-width="1"></path>
                        </svg>
                        店舗事業</a>
                    <a href="" class="item">
                        <svg xmlns="http://www.w3.org/2000/svg" width="9.207" height="17.414"
                            viewBox="0 0 9.207 17.414">
                            <path id="Path_44" data-name="Path 44" d="M9291.7,7842.993l8,8-8,8"
                                transform="translate(-9290.992 -7842.286)" fill="none" stroke="#080808"
                                stroke-linecap="round" stroke-linejoin="round" stroke-width="1"></path>
                        </svg>
                        店舗紹介</a>
                    <a href="" class="item">
                        <svg xmlns="http://www.w3.org/2000/svg" width="9.207" height="17.414"
                            viewBox="0 0 9.207 17.414">
                            <path id="Path_44" data-name="Path 44" d="M9291.7,7842.993l8,8-8,8"
                                transform="translate(-9290.992 -7842.286)" fill="none" stroke="#080808"
                                stroke-linecap="round" stroke-linejoin="round" stroke-width="1"></path>
                        </svg>
                        お知らせ</a>
                </div>
            </div>
            <div class="col col03">
                <div class="nav">
                    <a href="" class="item item01">
                        <svg xmlns="http://www.w3.org/2000/svg" width="9.207" height="17.414"
                            viewBox="0 0 9.207 17.414">
                            <path id="Path_44" data-name="Path 44" d="M9291.7,7842.993l8,8-8,8"
                                transform="translate(-9290.992 -7842.286)" fill="none" stroke="#080808"
                                stroke-linecap="round" stroke-linejoin="round" stroke-width="1"></path>
                        </svg>
                        防災・教材事業</a>
                    <a href="" class="item">
                        <svg xmlns="http://www.w3.org/2000/svg" width="9.207" height="17.414"
                            viewBox="0 0 9.207 17.414">
                            <path id="Path_44" data-name="Path 44" d="M9291.7,7842.993l8,8-8,8"
                                transform="translate(-9290.992 -7842.286)" fill="none" stroke="#080808"
                                stroke-linecap="round" stroke-linejoin="round" stroke-width="1"></path>
                        </svg>
                        お知らせ・イベント</a>
                    <a href="" class="item">
                        <svg xmlns="http://www.w3.org/2000/svg" width="9.207" height="17.414"
                            viewBox="0 0 9.207 17.414">
                            <path id="Path_44" data-name="Path 44" d="M9291.7,7842.993l8,8-8,8"
                                transform="translate(-9290.992 -7842.286)" fill="none" stroke="#080808"
                                stroke-linecap="round" stroke-linejoin="round" stroke-width="1"></path>
                        </svg>
                        お問い合わせ</a>

                </div>

            </div>
            <div class="col col04"></div>
        </div>
    </div>
</section>

<section class="secSitemap01 secSitemap01ab">
    <div class="container">
        <div class="grid">
            <div class="col col01">
                <div class="nav">
                    <a href="{{ base }}/{{ $menu_info['school'] }}" class="item item01">
                        <svg xmlns="http://www.w3.org/2000/svg" width="9.207" height="17.414"
                            viewBox="0 0 9.207 17.414">
                            <path id="Path_44" data-name="Path 44" d="M9291.7,7842.993l8,8-8,8"
                                transform="translate(-9290.992 -7842.286)" fill="none" stroke="#080808"
                                stroke-linecap="round" stroke-linejoin="round" stroke-width="1"></path>
                        </svg>
                        教室事業</a>
                    <a href="{{ base }}/{{ $menu_info['schola'] }}" class="item">
                        <svg xmlns="http://www.w3.org/2000/svg" width="9.207" height="17.414"
                            viewBox="0 0 9.207 17.414">
                            <path id="Path_44" data-name="Path 44" d="M9291.7,7842.993l8,8-8,8"
                                transform="translate(-9290.992 -7842.286)" fill="none" stroke="#080808"
                                stroke-linecap="round" stroke-linejoin="round" stroke-width="1"></path>
                        </svg>
                        陰山式スコーラプレミア</a>
                    <a href="{{ base }}/{{ $menu_info['curriculum'] }}" class="item item02">
                        <svg xmlns="http://www.w3.org/2000/svg" width="9" height="1" viewBox="0 0 9 1">
                            <path id="Path_44" data-name="Path 44" d="M9299.7,7858.993h-8"
                                transform="translate(-9291.2 -7858.493)" fill="none" stroke="#080808"
                                stroke-linecap="round" stroke-linejoin="round" stroke-width="1"></path>
                        </svg>
                        カリキュラム</a>
                    <a href="{{ base }}/{{ $menu_info['developer'] }}" class="item item02">
                        <svg xmlns="http://www.w3.org/2000/svg" width="9" height="1" viewBox="0 0 9 1">
                            <path id="Path_44" data-name="Path 44" d="M9299.7,7858.993h-8"
                                transform="translate(-9291.2 -7858.493)" fill="none" stroke="#080808"
                                stroke-linecap="round" stroke-linejoin="round" stroke-width="1"></path>
                        </svg>
                        開発者</a>
                    <a href="{{ base }}/{{ $menu_info['contact'] }}" class="item item02">
                        <svg xmlns="http://www.w3.org/2000/svg" width="9" height="1" viewBox="0 0 9 1">
                            <path id="Path_44" data-name="Path 44" d="M9299.7,7858.993h-8"
                                transform="translate(-9291.2 -7858.493)" fill="none" stroke="#080808"
                                stroke-linecap="round" stroke-linejoin="round" stroke-width="1"></path>
                        </svg>
                        お問い合わせ</a>
                </div>
            </div>
            <div class="col col02">
                <div class="nav">
                    <div class="item item01 item03"></div>
                    <a href="" class="item ">
                        <svg xmlns="http://www.w3.org/2000/svg" width="9.207" height="17.414"
                            viewBox="0 0 9.207 17.414">
                            <path id="Path_44" data-name="Path 44" d="M9291.7,7842.993l8,8-8,8"
                                transform="translate(-9290.992 -7842.286)" fill="none" stroke="#080808"
                                stroke-linecap="round" stroke-linejoin="round" stroke-width="1"></path>
                        </svg>
                        mpi英語倶楽部</a>
                    <a href="" class="item item02">
                        <svg xmlns="http://www.w3.org/2000/svg" width="9" height="1" viewBox="0 0 9 1">
                            <path id="Path_44" data-name="Path 44" d="M9299.7,7858.993h-8"
                                transform="translate(-9291.2 -7858.493)" fill="none" stroke="#080808"
                                stroke-linecap="round" stroke-linejoin="round" stroke-width="1"></path>
                        </svg>
                        カリキュラム</a>
                    <a href="" class="item item02">
                        <svg xmlns="http://www.w3.org/2000/svg" width="9" height="1" viewBox="0 0 9 1">
                            <path id="Path_44" data-name="Path 44" d="M9299.7,7858.993h-8"
                                transform="translate(-9291.2 -7858.493)" fill="none" stroke="#080808"
                                stroke-linecap="round" stroke-linejoin="round" stroke-width="1"></path>
                        </svg>
                        講師紹介</a>
                    <a href="" class="item item02">
                        <svg xmlns="http://www.w3.org/2000/svg" width="9" height="1" viewBox="0 0 9 1">
                            <path id="Path_44" data-name="Path 44" d="M9299.7,7858.993h-8"
                                transform="translate(-9291.2 -7858.493)" fill="none" stroke="#080808"
                                stroke-linecap="round" stroke-linejoin="round" stroke-width="1"></path>
                        </svg>
                        お問い合わせ</a>

                </div>
            </div>
            <div class="col col03">
                <div class="nav">
                    <div class="item item01 item03"></div>
                    <a href="" class="item">
                        <svg xmlns="http://www.w3.org/2000/svg" width="9.207" height="17.414"
                            viewBox="0 0 9.207 17.414">
                            <path id="Path_44" data-name="Path 44" d="M9291.7,7842.993l8,8-8,8"
                                transform="translate(-9290.992 -7842.286)" fill="none" stroke="#080808"
                                stroke-linecap="round" stroke-linejoin="round" stroke-width="1"></path>
                        </svg>
                        プログラボ</a>
                    <a href="" class="item item02">
                        <svg xmlns="http://www.w3.org/2000/svg" width="9" height="1" viewBox="0 0 9 1">
                            <path id="Path_44" data-name="Path 44" d="M9299.7,7858.993h-8"
                                transform="translate(-9291.2 -7858.493)" fill="none" stroke="#080808"
                                stroke-linecap="round" stroke-linejoin="round" stroke-width="1"></path>
                        </svg>
                        カリキュラム</a>
                    <a href="" class="item item02">
                        <svg xmlns="http://www.w3.org/2000/svg" width="9" height="1" viewBox="0 0 9 1">
                            <path id="Path_44" data-name="Path 44" d="M9299.7,7858.993h-8"
                                transform="translate(-9291.2 -7858.493)" fill="none" stroke="#080808"
                                stroke-linecap="round" stroke-linejoin="round" stroke-width="1"></path>
                        </svg>
                        講師紹介</a>
                    <a href="" class="item item02">
                        <svg xmlns="http://www.w3.org/2000/svg" width="9" height="1" viewBox="0 0 9 1">
                            <path id="Path_44" data-name="Path 44" d="M9299.7,7858.993h-8"
                                transform="translate(-9291.2 -7858.493)" fill="none" stroke="#080808"
                                stroke-linecap="round" stroke-linejoin="round" stroke-width="1"></path>
                        </svg>
                        お問い合わせ</a>
                </div>
            </div>
            <div class="col col04">
                <div class="nav">
                    <div class="item item01 item03"></div>
                    <a href="" class="item">
                        <svg xmlns="http://www.w3.org/2000/svg" width="9.207" height="17.414"
                            viewBox="0 0 9.207 17.414">
                            <path id="Path_44" data-name="Path 44" d="M9291.7,7842.993l8,8-8,8"
                                transform="translate(-9290.992 -7842.286)" fill="none" stroke="#080808"
                                stroke-linecap="round" stroke-linejoin="round" stroke-width="1"></path>
                        </svg>
                        その他スクール</a>
                    <a href="" class="item">
                        <svg xmlns="http://www.w3.org/2000/svg" width="9.207" height="17.414"
                            viewBox="0 0 9.207 17.414">
                            <path id="Path_44" data-name="Path 44" d="M9291.7,7842.993l8,8-8,8"
                                transform="translate(-9290.992 -7842.286)" fill="none" stroke="#080808"
                                stroke-linecap="round" stroke-linejoin="round" stroke-width="1"></path>
                        </svg>
                        スクールニュース</a>
                </div>
            </div>
        </div>
    </div>
</section>

<section class="secSitemap01 secSitemap01ac">
    <div class="container">
        <div class="grid">
            <div class="col col01">
                <div class="nav">
                    <a href="{{ base }}/{{ $menu_info['company'] }}" class="item item01">
                        <svg xmlns="http://www.w3.org/2000/svg" width="9.207" height="17.414"
                            viewBox="0 0 9.207 17.414">
                            <path id="Path_44" data-name="Path 44" d="M9291.7,7842.993l8,8-8,8"
                                transform="translate(-9290.992 -7842.286)" fill="none" stroke="#080808"
                                stroke-linecap="round" stroke-linejoin="round" stroke-width="1"></path>
                        </svg>
                        企業情報</a>
                </div>
            </div>
            <div class="col col02">
                <div class="nav">
                    <a href="{{ base }}/{{ $menu_info['privacy'] }}" class="item item01">
                        <svg xmlns="http://www.w3.org/2000/svg" width="9.207" height="17.414"
                            viewBox="0 0 9.207 17.414">
                            <path id="Path_44" data-name="Path 44" d="M9291.7,7842.993l8,8-8,8"
                                transform="translate(-9290.992 -7842.286)" fill="none" stroke="#080808"
                                stroke-linecap="round" stroke-linejoin="round" stroke-width="1"></path>
                        </svg>
                        プライバシーポリシー</a>
                </div>
            </div>
            <div class="col col03">
                <div class="nav">
                    <a href="{{ base }}/{{ $menu_info['sitemap'] }}" class="item item01">
                        <svg xmlns="http://www.w3.org/2000/svg" width="9.207" height="17.414"
                            viewBox="0 0 9.207 17.414">
                            <path id="Path_44" data-name="Path 44" d="M9291.7,7842.993l8,8-8,8"
                                transform="translate(-9290.992 -7842.286)" fill="none" stroke="#080808"
                                stroke-linecap="round" stroke-linejoin="round" stroke-width="1"></path>
                        </svg>
                        サイトマップ</a>
                </div>
            </div>
            <div class="col col04">
                <div class="nav">
                    <a href="{{ base }}/{{ $menu_info['contact'] }}" class="item item01">
                        <svg xmlns="http://www.w3.org/2000/svg" width="9.207" height="17.414"
                            viewBox="0 0 9.207 17.414">
                            <path id="Path_44" data-name="Path 44" d="M9291.7,7842.993l8,8-8,8"
                                transform="translate(-9290.992 -7842.286)" fill="none" stroke="#080808"
                                stroke-linecap="round" stroke-linejoin="round" stroke-width="1"></path>
                        </svg>
                        お問い合わせ</a>
                </div>
            </div>
        </div>
    </div>
</section>


{{ end section contents }}