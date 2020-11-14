{{ assign $site.title = $page.data.title . ' | ニュース | ' . $site.title }}
{{ assign $site.description = $page.data.title . ' | ニュース | ' . $site.description }}
{{ assign $site.url = 'school/news/detail_' . $page.data[$page.id] . '.html' }}

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

<section class="secDetail01 secDetail01aa">
    <div class="container">
        <div class="meta">
            {{ assign $format = 'Y.m.d' }}
            <div class="date">{{ $post.post_date|feggDate:$format }}</div>
            <div class="badgeBasic01 badgeBasic01Small badgeBasic01#356FBF">{{ $post.category|feggCategoryLabel:'news' }}</div>
        </div>
        <div class="ttl">{{ $page.data.title }}</div>
        <div class="content">{{ $page.data.content|noescape }}</div>
        <div class="pagination">
            <div class="list">
                <a href="" class="item">
                    Prev
                </a>
                <a href="" class="item">
                    一覧へ戻る
                </a>
                <a href="" class="item">
                    Next
                </a>
            </div>
        </div>
    </div>
</section>

<section class="secBasic04">
    <div class="backTop">
        <svg xmlns="http://www.w3.org/2000/svg" width="25.693" height="13.054" viewBox="0 0 25.693 13.054">
            <path id="Path_229" data-name="Path 229" d="M-11821.905,1626.305l12.5-12,12.5,12"
                transform="translate(11822.252 -1613.612)" fill="none" stroke="#fff" stroke-width="1"></path>
        </svg>
    </div>
    <div class="list">
        <div class="item">
            <div class="txt">
                <div class="title">陰山式スコーラ
                    プレミア</div>
                <div class="subtitle">無料体験・ご入会など
                    陰山式スコーラに関する
                    お問い合わせはこちら</div>
                <a href="#" class="btnBasic01 btn btnBasic01O#232448">
                    <div class="txt">
                        <div class="title">
                            お問い合わせ
                        </div>
                        <div class="icon iconRight">
                            <svg xmlns="http://www.w3.org/2000/svg" width="19.662" height="11.737"
                                viewBox="0 0 19.662 11.737">
                                <g id="Group_84" data-name="Group 84" transform="translate(0 0.369)">
                                    <path id="Path_194" data-name="Path 194" d="M155.775,803.688h19"
                                        transform="translate(-155.775 -798.152)" fill="none" stroke="#232448"
                                        stroke-width="1">
                                    </path>
                                    <path id="Path_195" data-name="Path 195" d="M168.275,783.965l6,5.5-6,5.5"
                                        transform="translate(-155.354 -783.965)" fill="none" stroke="#232448"
                                        stroke-width="1">
                                    </path>
                                </g>
                            </svg>
                        </div>
                    </div>
                </a>
            </div>
        </div>
        <div class="item">
            <div class="txt">
                <div class="title titleWhite">mpi英語倶楽部</div>
                <div class="subtitle subtitleWhite">無料体験・ご入会など
                    mpi英語倶楽部に関する
                    お問い合わせはこちら</div>
                <a href="#" class="btnBasic01 btn btnBasic01White">
                    <div class="txt">
                        <div class="title">
                            お問い合わせ
                        </div>
                        <div class="icon iconRight">
                            <svg xmlns="http://www.w3.org/2000/svg" width="19.662" height="11.737"
                                viewBox="0 0 19.662 11.737">
                                <g id="Group_84" data-name="Group 84" transform="translate(0 0.369)">
                                    <path id="Path_194" data-name="Path 194" d="M155.775,803.688h19"
                                        transform="translate(-155.775 -798.152)" fill="none" stroke="#232448"
                                        stroke-width="1">
                                    </path>
                                    <path id="Path_195" data-name="Path 195" d="M168.275,783.965l6,5.5-6,5.5"
                                        transform="translate(-155.354 -783.965)" fill="none" stroke="#232448"
                                        stroke-width="1">
                                    </path>
                                </g>
                            </svg>
                        </div>
                    </div>
                </a>
            </div>
        </div>
        <div class="item">
            <div class="txt">
                <div class="title">PlogLAB</div>
                <div class="subtitle">無料体験・ご入会など
                    PlogLABに関する
                    お問い合わせはこちら</div>
                <a href="#" class="btnBasic01 btn btnBasic01O#232448">
                    <div class="txt">
                        <div class="title">
                            お問い合わせ
                        </div>
                        <div class="icon iconRight">
                            <svg xmlns="http://www.w3.org/2000/svg" width="19.662" height="11.737"
                                viewBox="0 0 19.662 11.737">
                                <g id="Group_84" data-name="Group 84" transform="translate(0 0.369)">
                                    <path id="Path_194" data-name="Path 194" d="M155.775,803.688h19"
                                        transform="translate(-155.775 -798.152)" fill="none" stroke="#232448"
                                        stroke-width="1">
                                    </path>
                                    <path id="Path_195" data-name="Path 195" d="M168.275,783.965l6,5.5-6,5.5"
                                        transform="translate(-155.354 -783.965)" fill="none" stroke="#232448"
                                        stroke-width="1">
                                    </path>
                                </g>
                            </svg>
                        </div>
                    </div>
                </a>
            </div>

        </div>
    </div>
</section>

<footer class="footerBasic01">
    <div class="container">
        <div class="row">
            <div class="col01">
                <div class="logo">
                    <img src="./img/logo.svg" alt="" class="">
                </div>
                <div class="address">〒461-0002
                    愛知県名古屋市東区代官町34番15号</div>
                <div class="contact">
                    Tel :052-931-0400 Fax:052-932-2878
                </div>
            </div>
            <div class="col02">
                <div class="grid gridComp03">
                    <div class="col">
                        <div class="list">
                            <a href="" class="item">
                                <svg xmlns="http://www.w3.org/2000/svg" width="5.061" height="8.707"
                                    viewBox="0 0 5.061 8.707">
                                    <path id="Path_187" data-name="Path 187" d="M491.516,470.418l4,4-4,4"
                                        transform="translate(-491.162 -470.064)" fill="none" stroke="#232448"
                                        stroke-width="1" />
                                </svg>『Libretto』ブランド</a>
                            <a href="" class="item">
                                <svg xmlns="http://www.w3.org/2000/svg" width="5.061" height="8.707"
                                    viewBox="0 0 5.061 8.707">
                                    <path id="Path_187" data-name="Path 187" d="M491.516,470.418l4,4-4,4"
                                        transform="translate(-491.162 -470.064)" fill="none" stroke="#232448"
                                        stroke-width="1" />
                                </svg>店舗紹介</a>
                            <a href="" class="item">
                                <svg xmlns="http://www.w3.org/2000/svg" width="5.061" height="8.707"
                                    viewBox="0 0 5.061 8.707">
                                    <path id="Path_187" data-name="Path 187" d="M491.516,470.418l4,4-4,4"
                                        transform="translate(-491.162 -470.064)" fill="none" stroke="#232448"
                                        stroke-width="1" />
                                </svg>お知らせ</a>
                        </div>
                    </div>
                    <div class="col">
                        <div class="list">
                            <a href="" class="item">
                                <svg xmlns="http://www.w3.org/2000/svg" width="5.061" height="8.707"
                                    viewBox="0 0 5.061 8.707">
                                    <path id="Path_187" data-name="Path 187" d="M491.516,470.418l4,4-4,4"
                                        transform="translate(-491.162 -470.064)" fill="none" stroke="#232448"
                                        stroke-width="1" />
                                </svg>『Libretto School』</a>
                            <a href="" class="item">
                                <svg xmlns="http://www.w3.org/2000/svg" width="5.061" height="8.707"
                                    viewBox="0 0 5.061 8.707">
                                    <path id="Path_187" data-name="Path 187" d="M491.516,470.418l4,4-4,4"
                                        transform="translate(-491.162 -470.064)" fill="none" stroke="#232448"
                                        stroke-width="1" />
                                </svg>陰山式スコーラプレミア</a>
                            <a href="" class="item">
                                <svg xmlns="http://www.w3.org/2000/svg" width="5.061" height="8.707"
                                    viewBox="0 0 5.061 8.707">
                                    <path id="Path_187" data-name="Path 187" d="M491.516,470.418l4,4-4,4"
                                        transform="translate(-491.162 -470.064)" fill="none" stroke="#232448"
                                        stroke-width="1" />
                                </svg>mpi英語倶楽部</a>
                            <a href="" class="item">
                                <svg xmlns="http://www.w3.org/2000/svg" width="5.061" height="8.707"
                                    viewBox="0 0 5.061 8.707">
                                    <path id="Path_187" data-name="Path 187" d="M491.516,470.418l4,4-4,4"
                                        transform="translate(-491.162 -470.064)" fill="none" stroke="#232448"
                                        stroke-width="1" />
                                </svg>PlogLAB</a>
                            <a href="" class="item">
                                <svg xmlns="http://www.w3.org/2000/svg" width="5.061" height="8.707"
                                    viewBox="0 0 5.061 8.707">
                                    <path id="Path_187" data-name="Path 187" d="M491.516,470.418l4,4-4,4"
                                        transform="translate(-491.162 -470.064)" fill="none" stroke="#232448"
                                        stroke-width="1" />
                                </svg>その他スクール</a>
                            <a href="" class="item">
                                <svg xmlns="http://www.w3.org/2000/svg" width="5.061" height="8.707"
                                    viewBox="0 0 5.061 8.707">
                                    <path id="Path_187" data-name="Path 187" d="M491.516,470.418l4,4-4,4"
                                        transform="translate(-491.162 -470.064)" fill="none" stroke="#232448"
                                        stroke-width="1" />
                                </svg>School NEWS</a>
                        </div>
                    </div>
                    <div class="col">
                        <div class="list">
                            <a href="" class="item"><i class="icon-arrow"></i>
                                <svg xmlns="http://www.w3.org/2000/svg" width="5.061" height="8.707"
                                    viewBox="0 0 5.061 8.707">
                                    <path id="Path_187" data-name="Path 187" d="M491.516,470.418l4,4-4,4"
                                        transform="translate(-491.162 -470.064)" fill="none" stroke="#232448"
                                        stroke-width="1" />
                                </svg>教育事業・防災事業</a>
                            <a href="" class="item">
                                <svg xmlns="http://www.w3.org/2000/svg" width="5.061" height="8.707"
                                    viewBox="0 0 5.061 8.707">
                                    <path id="Path_187" data-name="Path 187" d="M491.516,470.418l4,4-4,4"
                                        transform="translate(-491.162 -470.064)" fill="none" stroke="#232448"
                                        stroke-width="1" />
                                </svg>お知らせ・イベント</a>
                        </div>
                    </div>
                    <div class="col">
                        <div class="list">
                            <a href="" class="item item01">
                                <svg xmlns="http://www.w3.org/2000/svg" width="5.061" height="8.707"
                                    viewBox="0 0 5.061 8.707">
                                    <path id="Path_187" data-name="Path 187" d="M491.516,470.418l4,4-4,4"
                                        transform="translate(-491.162 -470.064)" fill="none" stroke="#232448"
                                        stroke-width="1" />
                                </svg>企業情報</a>
                            <a href="" class="item">
                                <svg xmlns="http://www.w3.org/2000/svg" width="5.061" height="8.707"
                                    viewBox="0 0 5.061 8.707">
                                    <path id="Path_187" data-name="Path 187" d="M491.516,470.418l4,4-4,4"
                                        transform="translate(-491.162 -470.064)" fill="none" stroke="#232448"
                                        stroke-width="1" />
                                </svg>プライバシーポリシー</a>
                            <a href="" class="item">
                                <svg xmlns="http://www.w3.org/2000/svg" width="5.061" height="8.707"
                                    viewBox="0 0 5.061 8.707">
                                    <path id="Path_187" data-name="Path 187" d="M491.516,470.418l4,4-4,4"
                                        transform="translate(-491.162 -470.064)" fill="none" stroke="#232448"
                                        stroke-width="1" />
                                </svg>サイトマップ</a>
                            <a href="" class="item">
                                <svg xmlns="http://www.w3.org/2000/svg" width="5.061" height="8.707"
                                    viewBox="0 0 5.061 8.707">
                                    <path id="Path_187" data-name="Path 187" d="M491.516,470.418l4,4-4,4"
                                        transform="translate(-491.162 -470.064)" fill="none" stroke="#232448"
                                        stroke-width="1" />
                                </svg>お問い合わせ</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="copyright">
        Copyright © GAKKO RYOHIN. All Rights Reserved.
    </div>
</footer>

{{ end section contents }}