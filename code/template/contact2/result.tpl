{{ assign $site.title = 'お問い合わせ [完了] | ' . $site.title }}
{{ assign $site.description = 'お問い合わせ [完了] | ' . $site.description }}
{{ assign $site.url = 'school/schola/contact/complete.html' }}

{{ transclude '../template/siteframe' }}

{{ include head '../include/head/index' }}
{{ include foot '../include/foot/index' }}

{{ section contents }}


<section class="secBasic01 secBasic01contact">
    <div class="container">
        <div class="txt">
            <h1 class="title">スコーラについてのお問い合わせ</h1>
            <div class="subtitle">CONTACT</div>
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
            <a href="{{ base }}/{{ $menu_info['schola'] }}" class="item link">陰山式スコーラプレミア</a>
            <div class="item link icon">
                <svg xmlns="http://www.w3.org/2000/svg" width="5.2" height="7.399" viewBox="0 0 5.2 7.399">
                    <path id="Path_44" data-name="Path 44" d="M9291.7,7842.992l4,3-4,3"
                        transform="translate(-9290.999 -7842.292)" fill="none" stroke="#356fbf" stroke-linecap="round"
                        stroke-linejoin="round" stroke-width="1"></path>
                </svg>
            </div>
            <div class="item">お問い合わせ</div>
        </div>
    </div>
</section>

<section class="secComplete01 secComplete01aa">
    <div class="box">
        <div class="tab">
            <div class="item">
                <div class="title">入力</div>
            </div>
            <div class="item">
                <div class="title">確認</div>
            </div>
            <div class="item itemActive">
                <div class="title titleActive">送信</div>
            </div>
        </div>
        <div class="alert">
            お問い合わせいただきありがとうございます。
            内容を確認後、担当者よりご連絡いたします。
        </div>
        <div class="list">
            <div class="item">
                <a href="/" class="btnBasic01 btn btnBasic01O#232448">
                    <div class="txt">
                        <div class="title">
                            トップページ
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

{{ end section contents }}