{{ assign $site.title = 'お問い合わせ [確認] | ' . $site.title }}
{{ assign $site.description = 'お問い合わせ [確認] | ' . $site.description }}
{{ assign $site.url = 'school/schola/contact/confirm.html' }}

{{ transclude '../template/siteframe' }}

{{ include head './include/head/input' }}
{{ include foot './include/foot/input' }}

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
            <a href="" class="item link">陰山式スコーラプレミア</a>
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

<section class="secConfirm01 secConfirm01aa">
    <div class="box">
        <div class="tab">
            <div class="item">
                <div class="title">入力</div>
            </div>
            <div class="item itemActive">
                <div class="title titleActive">確認</div>
            </div>
            <div class="item">
                <div class="title">送信</div>
            </div>
        </div>
        <div class="form">
            <div class="item">
                <div class="grid">
                    <div class="col01">
                        <div class="title">
                            お問い合わせ種別
                        </div>
                    </div>
                    <div class="col02">
                        {{ assign $type_request = 'type_request' }}
                        {{ if isset($page.data[ $type_request ][0]) }}
                        {{ $page.data[ $type_request ][0] }}
                        {{ end }}
                        {{ if isset($page.data[ $type_request ][1]) }}
                        , {{ $page.data[ $type_request ][1] }}
                        {{ end }}
                        {{ if isset($page.data[ $type_request ][2]) }}
                        , {{ $page.data[ $type_request ][1] }}
                        {{ end }}
                    </div>
                </div>
            </div>
            <div class="item">
                <div class="grid">
                    <div class="col01">
                        <div class="title">
                            お子様のお名前
                        </div>
                    </div>
                    <div class="col02">
                        {{ assign $child_name = 'child_name' }}
                        {{ $page.data[ $child_name ] }}
                    </div>
                </div>
            </div>
            <div class="item">
                <div class="grid">
                    <div class="col01">
                        <div class="title">
                            ふりがな
                        </div>

                    </div>
                    <div class="col02">
                        {{ assign $child_name_furigana = 'child_name_furigana' }}
                        {{ $page.data[ $child_name_furigana ] }}
                    </div>
                </div>
            </div>
            <div class="item">
                <div class="grid">
                    <div class="col01">
                        <div class="title">
                            お子様の年齢・学年
                        </div>

                    </div>
                    <div class="col02">
                        {{ assign $child_age = 'child_age' }}
                        {{ $page.data[ $child_age ] }}
                    </div>
                </div>
            </div>
            <div class="item">
                <div class="grid">
                    <div class="col01">
                        <div class="title">
                            保護者様のお名前
                        </div>

                    </div>
                    <div class="col02">
                        {{ assign $parent_name = 'parent_name' }}
                        {{ $page.data[ $parent_name ] }}
                    </div>
                </div>
            </div>
            <div class="item">
                <div class="grid">
                    <div class="col01">
                        <div class="title">
                            ふりがな
                        </div>

                    </div>
                    <div class="col02">
                        {{ assign $parent_name_furigana = 'parent_name_furigana' }}
                        {{ $page.data[ $parent_name_furigana ] }}
                    </div>
                </div>
            </div>
            <div class="item">
                <div class="grid">
                    <div class="col01">
                        <div class="title">
                            メールアドレス
                        </div>

                    </div>
                    <div class="col02">
                        {{ assign $email = 'email' }}
                        {{ $page.data[ $email ] }}
                    </div>
                </div>
            </div>
            <div class="item">
                <div class="grid">
                    <div class="col01">
                        <div class="title">
                            ご住所
                        </div>

                    </div>
                    <div class="col02">
                        {{ assign $address = 'address' }}
                        {{ $page.data[ $address ] }}
                    </div>
                </div>
            </div>
            <div class="item">
                <div class="grid">
                    <div class="col01">
                        <div class="title">
                            お電話番号
                        </div>

                    </div>
                    <div class="col02">
                        {{ assign $tel = 'tel' }}
                        {{ $page.data[ $tel ] }}
                    </div>
                </div>
            </div>
            <div class="item itemBig">
                <div class="grid">
                    <div class="col01">
                        <div class="title title01">お問い合わせ内容を
                            ご記入ください</div>
                    </div>
                    <div class="col02">
                        <div class="txt">
                            {{ assign $question = 'question' }}
                            {{ $page.data[ $question ] }}
                        </div>
                    </div>
                </div>
            </div>
            <div class="item itemMedium">
                <div class="grid">
                    <div class="col01">
                        <div class="title">
                            個人情報保護方針
                        </div>
                    </div>
                    <div class="col02">
                        {{ assign $question = 'question' }}
                        {{ $page.data[ $question ] }}
                    </div>
                </div>
            </div>
        </div>
        <div class="list">
            <div class="item">
                <a href="#" class="btnBasic01 btn btnBasic01#232448">
                    <div class="txt">
                        <div class="title">
                            修正する
                        </div>
                        <div class="icon iconLeft">
                            <svg xmlns="http://www.w3.org/2000/svg" width="19.662" height="11.737"
                                viewBox="0 0 19.662 11.737">
                                <g id="Group_86" data-name="Group 86" transform="translate(19.662 11.369) rotate(180)">
                                    <path id="Path_194" data-name="Path 194" d="M155.775,803.688h19"
                                        transform="translate(-155.775 -798.152)" fill="none" stroke="#fff"
                                        stroke-width="1"></path>
                                    <path id="Path_195" data-name="Path 195" d="M168.275,783.965l6,5.5-6,5.5"
                                        transform="translate(-155.354 -783.965)" fill="none" stroke="#fff"
                                        stroke-width="1"></path>
                                </g>
                            </svg>
                        </div>
                    </div>
                </a>
            </div>
            <div class="item">
                <a href="#" class="btnBasic01 btn btnBasic01O#232448">
                    <div class="txt">
                        <div class="title">
                            送信する
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