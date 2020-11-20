{{ if isset($site.url) }}
<header class="headerBasic01">
{{ else }}
<header class="headerBasic01 headerBasic01aa">
{{ end }}
    {{ if isset($site.url) }}
    <a href="/" class="logo">
    <img src="{{ base }}/data/img/logo10@2x.png" alt="株式会社学校良品" srcset="">
    </a>
    {{ else }}
    <h1>
        <a href="/" class="logo">
            <img src="{{ base }}/data/img/logo10@2x.png" alt="株式会社学校良品" srcset="">
        </a>
    </h1>
    {{ end }}
    <div class="right">
        <div class="nav">
            <nav class="list">
                <a href="/" class="item">店舗事業</a>
                <a href="{{ base }}/{{ $menu_info['school'] }}" class="item">教室事業</a>
                <a href="#" class="item">防災・教材事業</a>
                <a href="{{ base }}/{{ $menu_info['company'] }}" class="item">企業情報</a>
            </nav>
        </div>
        <a href="{{ base }}/{{ $menu_info['contact'] }}" class="contact">
            <div class="txt">
                <div class="title">CONTACT</div>
                <div class="subtitle">お問い合わせ</div>
            </div>
        </a>
    </div>
</header>

<header class="headerBasic02">
    {{ if isset($site.url) }}
    <a href="/" class="logo">
        <img src="{{ base }}/data/img/logo11@2x.png" alt="株式会社学校良品">
    </a>
    {{ else }}
    <h1>
        <a href="/" class="logo">
            <img src="{{ base }}/data/img/logo11@2x.png" alt="株式会社学校良品">
        </a>
    </h1>
    {{ end }}
    <div class="icon iconOpen">
        <svg xmlns="http://www.w3.org/2000/svg" width="34.5" height="44.5" viewBox="0 0 34.5 44.5">
            <g id="icn_menu" transform="translate(-258.5 -15.5)">
                <path id="Path_196" data-name="Path 196" d="M0,0H34.011" transform="translate(258.5 16)" fill="none"
                    stroke="#232448" stroke-width="1" />
                <path id="Path_197" data-name="Path 197" d="M0,0H34.011" transform="translate(258.5 28)" fill="none"
                    stroke="#232448" stroke-width="1" />
                <path id="Path_198" data-name="Path 198" d="M0,0H34.011" transform="translate(258.5 41)" fill="none"
                    stroke="#232448" stroke-width="1" />
                <text id="menu" transform="translate(276 57)" fill="#232448" font-size="12"
                    font-family="NotoSerifJP-Light, Noto Serif JP" font-weight="300">
                    <tspan x="-16.818" y="0">menu</tspan>
                </text>
            </g>
        </svg>
    </div>
    <div class="menu">
        <div class="icon iconClose">
            <svg xmlns="http://www.w3.org/2000/svg" width="30" height="41.099" viewBox="0 0 30 41.099">
                <g id="icn_menu" transform="translate(-318.5 -21.901)">
                    <text id="close" transform="translate(333.5 60)" fill="#fff" font-size="12"
                        font-family="NotoSerifJP-Light, Noto Serif JP" font-weight="300">
                        <tspan x="-14.634" y="0">close</tspan>
                    </text>
                    <g id="Group_147" data-name="Group 147" transform="translate(51.5 -5)">
                        <line id="Line_56" data-name="Line 56" x2="21" y2="20.5" transform="translate(272 27.5)"
                            fill="none" stroke="#fff" stroke-width="1" />
                    </g>
                    <g id="Group_148" data-name="Group 148" transform="translate(296 315.25) rotate(-90)">
                        <line id="Line_56-2" data-name="Line 56" x2="21" y2="20.5" transform="translate(272 27.5)"
                            fill="none" stroke="#fff" stroke-width="1" />
                    </g>
                </g>
            </svg>

        </div>
        <ul class="list">
            <li class="item">
                <a href="/" class="link">
                    トップページ
                    <svg xmlns="http://www.w3.org/2000/svg" width="8.061" height="14.707" viewBox="0 0 8.061 14.707">
                        <path id="Path_223" data-name="Path 223" d="M491.516,470.418l7,7-7,7"
                            transform="translate(-491.162 -470.064)" fill="none" stroke="#fff" stroke-width="1" />
                    </svg>
                </a>
            </li>
            <li class="item">
                <a href="" class="link">
                    店舗事業
                    <svg xmlns="http://www.w3.org/2000/svg" width="8.061" height="14.707" viewBox="0 0 8.061 14.707">
                        <path id="Path_223" data-name="Path 223" d="M491.516,470.418l7,7-7,7"
                            transform="translate(-491.162 -470.064)" fill="none" stroke="#fff" stroke-width="1" />
                    </svg>
                </a>
                <ul class="list">
                    <li class="item">
                        <a href="" class="link">
                            店舗紹介
                            <svg xmlns="http://www.w3.org/2000/svg" width="8.061" height="14.707"
                                viewBox="0 0 8.061 14.707">
                                <path id="Path_223" data-name="Path 223" d="M491.516,470.418l7,7-7,7"
                                    transform="translate(-491.162 -470.064)" fill="none" stroke="#fff"
                                    stroke-width="1" />
                            </svg>
                        </a>
                    </li>
                    <li class="item">
                        <a href="" class="link">
                            お知らせ
                            <svg xmlns="http://www.w3.org/2000/svg" width="8.061" height="14.707"
                                viewBox="0 0 8.061 14.707">
                                <path id="Path_223" data-name="Path 223" d="M491.516,470.418l7,7-7,7"
                                    transform="translate(-491.162 -470.064)" fill="none" stroke="#fff"
                                    stroke-width="1" />
                            </svg>
                        </a>
                    </li>
                </ul>
            </li>
            <li class="item">
                <a href="{{ base }}/{{ $menu_info['school'] }}" class="link">
                    教室事業
                    <svg xmlns="http://www.w3.org/2000/svg" width="8.061" height="14.707" viewBox="0 0 8.061 14.707">
                        <path id="Path_223" data-name="Path 223" d="M491.516,470.418l7,7-7,7"
                            transform="translate(-491.162 -470.064)" fill="none" stroke="#fff" stroke-width="1" />
                    </svg>
                </a>
                <ul class="list">
                    <li class="item">
                        <a href="{{ base }}/{{ $menu_info['schola'] }}" class="link">
                            陰山式スコーラプレミア
                            <svg xmlns="http://www.w3.org/2000/svg" width="8.061" height="14.707"
                                viewBox="0 0 8.061 14.707">
                                <path id="Path_223" data-name="Path 223" d="M491.516,470.418l7,7-7,7"
                                    transform="translate(-491.162 -470.064)" fill="none" stroke="#fff"
                                    stroke-width="1" />
                            </svg>
                        </a>
                    </li>
                    <li class="item">
                        <a href="" class="link">
                            mpi英語倶楽部
                            <svg xmlns="http://www.w3.org/2000/svg" width="8.061" height="14.707"
                                viewBox="0 0 8.061 14.707">
                                <path id="Path_223" data-name="Path 223" d="M491.516,470.418l7,7-7,7"
                                    transform="translate(-491.162 -470.064)" fill="none" stroke="#fff"
                                    stroke-width="1" />
                            </svg>
                        </a>
                    </li>
                    <li class="item">
                        <a href="" class="link">
                            プログラボ
                            <svg xmlns="http://www.w3.org/2000/svg" width="8.061" height="14.707"
                                viewBox="0 0 8.061 14.707">
                                <path id="Path_223" data-name="Path 223" d="M491.516,470.418l7,7-7,7"
                                    transform="translate(-491.162 -470.064)" fill="none" stroke="#fff"
                                    stroke-width="1" />
                            </svg>
                        </a>
                    </li>
                    <li class="item">
                        <a href="" class="link">
                            その他スクール
                            <svg xmlns="http://www.w3.org/2000/svg" width="8.061" height="14.707"
                                viewBox="0 0 8.061 14.707">
                                <path id="Path_223" data-name="Path 223" d="M491.516,470.418l7,7-7,7"
                                    transform="translate(-491.162 -470.064)" fill="none" stroke="#fff"
                                    stroke-width="1" />
                            </svg>
                        </a>
                    </li>
                    <li class="item">
                        <a href="" class="link">
                            スクールニュース
                            <svg xmlns="http://www.w3.org/2000/svg" width="8.061" height="14.707"
                                viewBox="0 0 8.061 14.707">
                                <path id="Path_223" data-name="Path 223" d="M491.516,470.418l7,7-7,7"
                                    transform="translate(-491.162 -470.064)" fill="none" stroke="#fff"
                                    stroke-width="1" />
                            </svg>
                        </a>
                    </li>
                </ul>
            </li>
            <li class="item">
                <a href="{{ base }}/{{ $menu_info['news'] }}" class="link">
                    教育事業・防災事業
                    <svg xmlns="http://www.w3.org/2000/svg" width="8.061" height="14.707" viewBox="0 0 8.061 14.707">
                        <path id="Path_223" data-name="Path 223" d="M491.516,470.418l7,7-7,7"
                            transform="translate(-491.162 -470.064)" fill="none" stroke="#fff" stroke-width="1" />
                    </svg>
                </a>
                <ul class="list">
                    <li class="item">
                        <a href="" class="link">
                            お知らせ・イベント
                            <svg xmlns="http://www.w3.org/2000/svg" width="8.061" height="14.707"
                                viewBox="0 0 8.061 14.707">
                                <path id="Path_223" data-name="Path 223" d="M491.516,470.418l7,7-7,7"
                                    transform="translate(-491.162 -470.064)" fill="none" stroke="#fff"
                                    stroke-width="1" />
                            </svg>
                        </a>
                    </li>
                </ul>

            </li>
            <li class="item">
                <a href="{{ base }}/{{ $menu_info['company'] }}" class="link">
                    企業案内
                    <svg xmlns="http://www.w3.org/2000/svg" width="8.061" height="14.707" viewBox="0 0 8.061 14.707">
                        <path id="Path_223" data-name="Path 223" d="M491.516,470.418l7,7-7,7"
                            transform="translate(-491.162 -470.064)" fill="none" stroke="#fff" stroke-width="1" />
                    </svg>
                </a>
            </li>
            <li class="item">
                <a href="{{ base }}/{{ $menu_info['privacy'] }}" class="link">
                    プライバシポリシー
                    <svg xmlns="http://www.w3.org/2000/svg" width="8.061" height="14.707" viewBox="0 0 8.061 14.707">
                        <path id="Path_223" data-name="Path 223" d="M491.516,470.418l7,7-7,7"
                            transform="translate(-491.162 -470.064)" fill="none" stroke="#fff" stroke-width="1" />
                    </svg>
                </a>

            </li>
            <li class="item">
                <a href="{{ base }}/{{ $menu_info['sitemap'] }}" class="link">
                    サイトマップ
                    <svg xmlns="http://www.w3.org/2000/svg" width="8.061" height="14.707" viewBox="0 0 8.061 14.707">
                        <path id="Path_223" data-name="Path 223" d="M491.516,470.418l7,7-7,7"
                            transform="translate(-491.162 -470.064)" fill="none" stroke="#fff" stroke-width="1" />
                    </svg>
                </a>

            </li>
            <li class="item">
                <a href="{{ base }}/{{ $menu_info['contact'] }}" class="link">
                    お問い合わせ
                    <svg xmlns="http://www.w3.org/2000/svg" width="8.061" height="14.707" viewBox="0 0 8.061 14.707">
                        <path id="Path_223" data-name="Path 223" d="M491.516,470.418l7,7-7,7"
                            transform="translate(-491.162 -470.064)" fill="none" stroke="#fff" stroke-width="1" />
                    </svg>
                </a>

            </li>
    </div>
</header>