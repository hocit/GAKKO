{{ assign $site.title = 'スコーラについてのお問い合わせ | 陰山式スコーラプレミアについて | 教室事業 | 株式会社学校良品' }}
{{ assign $site.description = '学校良品の教室事業、陰山式スコーラプレミアのお問い合わせはこちらから。' }}
{{ assign $site.url = 'school/schola/contact/' }}

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
            <a href="{{ base }}/{{ $menu_info['schola'] }}" class="item link">TOP</a>
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

<section class="secContact01 secContact01aa">
    <div class="box">
        <div class="title">
            以下のフォームに必要事項をご記入のうえ「入力内容の確認」ボタンを押してください。必須項目は、必ずご記入ください。
            また、お電話でのお問い合わせをご希望の方は、以下の番号までお問い合わせください。
        </div>
        <div class="contact">
            <div class="txt">
                <a href="{{ $site.tel.url }}" class="tel">
                    TEL：{{ $site.tel.num }}
                </a>
                <div class="line"></div>
                <div class="time">受付時間：9時～18時
                    土日祝日、夏季休暇、年末年始を除く）</div>
            </div>
        </div>
        <div class="tab">
            <div class="item itemActive">
                <div class="title titleActive">入力</div>
            </div>
            <div class="item">
                <div class="title">確認</div>
            </div>
            <div class="item">
                <div class="title">送信</div>
            </div>
        </div>
        <form id="contact-form" action="{{ base }}/school/schola/contact/confirm.html" method="post">
            <div class="form">
                <div class="item">
                    <div class="grid">
                        <div class="col01">
                            <div class="title">
                                お問い合わせ種別
                            </div>
                            <div class="note">
                                必須
                            </div>
                        </div>
                        <div class="col02">
                            <div class="grid">
                                {{ assign $type = 'type' }}
                                {{ if isset($page.error.type )}}
                                <div class="item item01">
                                    <label for="label_01" class="chkBasic01 chkBasic01err chk01">
                                        <input type="checkbox" value="資料請求" id="label_01" name="{{ $type }}[]" data-parsley-mincheck="1" required="">
                                        <span class="mark">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="16.562" height="10.917"
                                                viewBox="0 0 16.562 10.917">
                                                <path id="Path_220" data-name="Path 220"
                                                    d="M-12674.319,1707.73l5.645,5.644,10.917-10.917-10.917,7.425Z"
                                                    transform="translate(12674.319 -1702.456)" fill="#fff"></path>
                                            </svg>

                                        </span>
                                    </label>
                                    <label for="label_01" class="title">資料請求</label>
                                </div>
                                <div class="item item01">
                                    <label for="label_02" class="chkBasic01 chkBasic01err chk01" data-parsley-mincheck="1" required="">
                                        <input type="checkbox" value="体験授業" id="label_02" name="{{ $type }}[]">
                                        <span class="mark">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="16.562" height="10.917"
                                                viewBox="0 0 16.562 10.917">
                                                <path id="Path_220" data-name="Path 220"
                                                    d="M-12674.319,1707.73l5.645,5.644,10.917-10.917-10.917,7.425Z"
                                                    transform="translate(12674.319 -1702.456)" fill="#fff"></path>
                                            </svg>
                                        </span>
                                    </label>
                                    <label for="label_02" class="title">体験授業</label>
                                </div>
                                <div class="item item01">
                                    <label for="label_03" class="chkBasic01 chkBasic01err chk01" data-parsley-mincheck="1" required="">
                                        <input type="checkbox" value="その他質問など" id="label_03" name="{{ $type }}[]">
                                        <span class="mark">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="16.562" height="10.917"
                                                viewBox="0 0 16.562 10.917">
                                                <path id="Path_220" data-name="Path 220"
                                                    d="M-12674.319,1707.73l5.645,5.644,10.917-10.917-10.917,7.425Z"
                                                    transform="translate(12674.319 -1702.456)" fill="#fff"></path>
                                            </svg>
                                        </span>
                                    </label>
                                    <label for="label_03" class="title">その他質問など</label>
                                </div>
                                <div class="tltBasic01 tlt01">
                                    <div class="ttl">
                                        必ずどれかをチェックしてください。
                                    </div>
                                <div class="arrow"></div>
                                </div>
                                {{ else}}
                                <div class="item item01">
                                    <label for="label_01" class="chkBasic01 chk01">
                                        {{ if $page.data[ $type ][0] === '資料請求' }}
                                        <input type="checkbox" checked value="資料請求" id="label_01" name="{{ $type }}[]" data-parsley-mincheck="1" required="">
                                        {{ else }}
                                        <input type="checkbox" value="資料請求" id="label_01" name="{{ $type }}[]" data-parsley-mincheck="1" required="">
                                        {{ end }}
                                        <span class="mark">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="16.562" height="10.917"
                                                viewBox="0 0 16.562 10.917">
                                                <path id="Path_220" data-name="Path 220"
                                                    d="M-12674.319,1707.73l5.645,5.644,10.917-10.917-10.917,7.425Z"
                                                    transform="translate(12674.319 -1702.456)" fill="#fff"></path>
                                            </svg>

                                        </span>
                                    </label>
                                    <label for="label_01" class="title">資料請求</label>
                                </div>
                                <div class="item item01">
                                    <label for="label_02" class="chkBasic01 chk01">
                                        {{ if $page.data[ $type ][0] === '体験授業' || $page.data[ $type ][1] === '体験授業' }}
                                        <input type="checkbox" checked value="体験授業" id="label_02" name="{{ $type }}[]" data-parsley-mincheck="1" required="">
                                        {{ else }}
                                        <input type="checkbox" value="体験授業" id="label_02" name="{{ $type }}[]" data-parsley-mincheck="1" required="">
                                        {{ end }}
                                        <span class="mark">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="16.562" height="10.917"
                                                viewBox="0 0 16.562 10.917">
                                                <path id="Path_220" data-name="Path 220"
                                                    d="M-12674.319,1707.73l5.645,5.644,10.917-10.917-10.917,7.425Z"
                                                    transform="translate(12674.319 -1702.456)" fill="#fff"></path>
                                            </svg>
                                        </span>
                                    </label>
                                    <label for="label_02" class="title">体験授業</label>
                                </div>
                                <div class="item item01">
                                    <label for="label_03" class="chkBasic01 chk01">
                                        {{ if $page.data[ $type ][0] === 'その他質問など' || $page.data[ $type ][1] === 'その他質問など' || $page.data[ $type ][2] === 'その他質問など' }}
                                        <input type="checkbox" checked value="その他質問など" id="label_03" name="{{ $type }}[]" data-parsley-mincheck="1" required="">
                                        {{ else }}
                                        <input type="checkbox" value="その他質問など" id="label_03" name="{{ $type }}[]" data-parsley-mincheck="1" required="">
                                        {{ end }}
                                        <span class="mark">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="16.562" height="10.917"
                                                viewBox="0 0 16.562 10.917">
                                                <path id="Path_220" data-name="Path 220"
                                                    d="M-12674.319,1707.73l5.645,5.644,10.917-10.917-10.917,7.425Z"
                                                    transform="translate(12674.319 -1702.456)" fill="#fff"></path>
                                            </svg>
                                        </span>
                                    </label>
                                    <label for="label_03" class="title">その他質問など</label>
                                </div>
                                {{ end }}
                            </div>
                        </div>
                    </div>
                </div>
                <div class="item">
                    <div class="grid">
                        <div class="col01">
                            <div class="title">
                                お子様のお名前
                            </div>
                            <div class="note">
                                必須
                            </div>
                        </div>
                        <div class="col02">
                            {{ assign $child_name = 'child_name' }}
                            {{ if isset($page.error.child_name )}}
                            <input name="{{ $child_name }}" type="text" class="iptBasic01 iptBasic01err ipt01" placeholder="山田太郎">
                            <div class="tltBasic01 tlt02">
                                <div class="ttl">
                                    必ず入力してください。
                                </div>
                                <div class="arrow"></div>
                            </div>
                            {{ else }}
                            <input name="{{ $child_name }}" value="{{ $page.data[ $child_name ] }}" type="text" class="iptBasic01 ipt01" placeholder="山田太郎">
                            {{ end }}
                        </div>
                    </div>
                </div>
                <div class="item">
                    <div class="grid">
                        <div class="col01">
                            <div class="title">
                                ふりがな
                            </div>
                            <div class="note">
                                必須
                            </div>
                        </div>
                        <div class="col02">
                            {{ assign $child_name_phonetic = 'child_name_phonetic' }}
                            {{ if isset($page.error.child_name_phonetic )}}
                            <input name="{{ $child_name_phonetic }}" type="text" class="iptBasic01 iptBasic01err ipt01"
                                placeholder="やまだたろう">
                            <div class="tltBasic01 tlt02">
                                <div class="ttl">
                                    必ず入力してください。
                                </div>
                                <div class="arrow"></div>
                            </div>
                            {{ else }}
                            <input name="{{ $child_name_phonetic }}" value="{{ $page.data[ $child_name_phonetic ] }}" type="text" class="iptBasic01 ipt01"
                                placeholder="やまだたろう">
                            {{ end }}
                        </div>
                    </div>
                </div>
                <div class="item">
                    <div class="grid">
                        <div class="col01">
                            <div class="title">
                                お子様の年齢・学年
                            </div>
                            <div class="note">
                                必須
                            </div>
                        </div>
                        <div class="col02">
                            {{ assign $age = 'age' }}
                            {{ if isset($page.error.age )}}
                            <input name="{{ $age }}" type="text" class="iptBasic01 iptBasic01err ipt01"
                                placeholder="小学1年生">
                            <div class="tltBasic01 tlt02">
                                <div class="ttl">
                                    必ず入力してください。
                                </div>
                                <div class="arrow"></div>
                            </div>
                            {{ else }}
                            <input name="{{ $age }}" value="{{ $page.data[ $age ] }}"  type="text" class="iptBasic01 ipt01" placeholder="小学1年生">
                            {{ end }}
                        </div>
                    </div>
                </div>
                <div class="item">
                    <div class="grid">
                        <div class="col01">
                            <div class="title">
                                保護者様のお名前
                            </div>
                            <div class="note">
                                必須
                            </div>
                        </div>
                        <div class="col02">
                            {{ assign $parent_name = 'parent_name' }}
                            {{ if isset($page.error.parent_name )}}
                            <input name="{{ $parent_name }}" type="text" class="iptBasic01 iptBasic01err ipt01"
                                placeholder="山田太郎">
                            <div class="tltBasic01 tlt02">
                                <div class="ttl">
                                    必ず入力してください。
                                </div>
                                <div class="arrow"></div>
                            </div>
                            {{ else }}
                            <input name="{{ $parent_name }}" value="{{ $page.data[ $parent_name ] }}" type="text" class="iptBasic01 ipt01" placeholder="山田太郎">
                            {{ end }}
                        </div>
                    </div>
                </div>
                <div class="item">
                    <div class="grid">
                        <div class="col01">
                            <div class="title">
                                ふりがな
                            </div>
                            <div class="note">
                                必須
                            </div>
                        </div>
                        <div class="col02">
                            {{ assign $parent_name_phonetic = 'parent_name_phonetic' }}
                            {{ if isset($page.error.parent_name_phonetic )}}
                            <input name="{{ $parent_name_phonetic }}" type="text" class="iptBasic01 iptBasic01err ipt01"
                                placeholder="やまだたろう">
                            <div class="tltBasic01 tlt02">
                                <div class="ttl">
                                    必ず入力してください。
                                </div>
                                <div class="arrow"></div>
                            </div>
                            {{ else }}
                            <input name="{{ $parent_name_phonetic }}" value="{{ $page.data[ $parent_name_phonetic ] }}" type="text" class="iptBasic01 ipt01"
                                placeholder="やまだたろう">
                            {{ end }}
                        </div>
                    </div>
                </div>
                <div class="item">
                    <div class="grid">
                        <div class="col01">
                            <div class="title">
                                メールアドレス
                            </div>
                            <div class="note">
                                必須
                            </div>
                        </div>
                        <div class="col02">
                            {{ assign $email = 'email' }}
                            {{ if isset($page.error.email )}}
                            <input name="{{ $email }}" type="text" class="iptBasic01 iptBasic01err ipt01" placeholder="ryouhin@chunichi-shobou.co.jp">
                            <div class="tltBasic01 tlt02">
                                <div class="ttl">
                                    必ず入力してください。
                                </div>
                                <div class="arrow"></div>
                            </div>
                            {{ else }}
                            <input name="{{ $email }}" value="{{ $page.data[ $email ] }}" type="text" class="iptBasic01 ipt01" placeholder="ryouhin@chunichi-shobou.co.jp">
                            {{ end }}
                        </div>
                    </div>
                </div>
                <div class="item">
                    <div class="grid">
                        <div class="col01">
                            <div class="title">
                                お電話番号
                            </div>
                            <div class="note">
                                必須
                            </div>
                        </div>
                        <div class="col02">
                            {{ assign $tel = 'tel' }}
                            {{ if isset($page.error.tel )}}
                            <input name="{{ $tel }}" type="text" class="iptBasic01 iptBasic01err ipt01" placeholder="052-931-0400">
                            <div class="tltBasic01 tlt02">
                                <div class="ttl">
                                    必ず入力してください。
                                </div>
                                <div class="arrow"></div>
                            </div>
                            {{ else }}
                            <input name="{{ $tel }}" value="{{ $page.data[ $tel ] }}" type="text" class="iptBasic01 ipt01" placeholder="052-931-0400">
                            {{ end }}
                        </div>
                    </div>
                </div>
                <div class="item">
                    <div class="grid">
                        <div class="col01">
                            <div class="title">
                                ご住所
                            </div>
                            <div class="note">
                                必須
                            </div>
                        </div>
                        <div class="col02">
                            {{ assign $address = 'address' }}
                            {{ if isset($page.error.address )}}
                            <input name="{{ $address }}" type="text" class="iptBasic01 iptBasic01err ipt01" placeholder="愛知県名古屋市東区代官町34番15号">
                            <div class="tltBasic01 tlt02">
                                <div class="ttl">
                                    必ず入力してください。
                                </div>
                                <div class="arrow"></div>
                            </div>
                            {{ else }}
                            <input name="{{ $address }}" value="{{ $page.data[ $address ] }}" type="text" class="iptBasic01 ipt01" placeholder="愛知県名古屋市東区代官町34番15号">
                            {{ end }}
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
                            {{ assign $content = 'content' }}
                            <textarea name="{{ $content }}" id="" cols="30" rows="10" class="txtBasic01 txt01"
                                placeholder="お問い合わせ内容をご記入ください">{{ $page.data[ $content ] }}</textarea>
                        </div>
                    </div>
                </div>
                <div class="item itemMedium">
                    <div class="grid">
                        <div class="col01">
                            <div class="title">
                                個人情報保護方針
                            </div>
                            <div class="note">
                                必須
                            </div>
                        </div>
                        <div class="col02">
                            {{ assign $privacy = 'privacy' }}
                            {{ if isset($page.error.privacy )}}
                            <div class="tltBasic01 tlt03">
                                <div class="ttl">
                                    必ず入力してください。
                                </div>
                                <div class="arrow"></div>
                            </div>
                            <div class="iagree">
                                <div class="chk">
                                    <label for="label_04" class="chkBasic01 chkBasic01err chk01">
                                        <input name="{{ $privacy }}" type="checkbox" id="label_04">
                                        <span class="mark">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="16.562" height="10.917"
                                                viewBox="0 0 16.562 10.917">
                                                <path id="Path_220" data-name="Path 220"
                                                    d="M-12674.319,1707.73l5.645,5.644,10.917-10.917-10.917,7.425Z"
                                                    transform="translate(12674.319 -1702.456)" fill="#fff"></path>
                                            </svg>
                                        </span>
                                    </label>
                                    <label for="label_04" class="title">同意する</label>
                                </div>
                                <div class="title">※個人情報の取り扱いについては、<a href="#">プライバシーポリシー</a>をご覧ください。</div>
                            </div>
                            {{ else }}
                            <div class="iagree">
                                <div class="chk">
                                    <label for="label_04" class="chkBasic01 chk01">
                                        {{ if $page.data[ $privacy ] === '1' }}
                                        <input name="{{ $privacy }}" checked value="1" type="checkbox" id="label_04">
                                        {{ else }}
                                        <input name="{{ $privacy }}" value="1" type="checkbox" id="label_04">
                                        {{ end }}
                                        <span class="mark">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="16.562" height="10.917"
                                                viewBox="0 0 16.562 10.917">
                                                <path id="Path_220" data-name="Path 220"
                                                    d="M-12674.319,1707.73l5.645,5.644,10.917-10.917-10.917,7.425Z"
                                                    transform="translate(12674.319 -1702.456)" fill="#fff"></path>
                                            </svg>
                                        </span>
                                    </label>
                                    <label for="label_04" class="title">同意する</label>
                                </div>
                                <div class="title">※個人情報の取り扱いについては、<a href="{{ base }}/{{ $menu_info['privacy'] }}">プライバシーポリシー</a>をご覧ください。</div>
                            </div>
                            {{ end }}
                        </div>
                    </div>
                </div>
            </div>
            <button type="submit" class="btnBasic01 btn btnBasic01O#232448">
                <div class="txt">
                    <div class="title">
                        入力内容の確認
                    </div>
                    <div class="icon iconRight">
                        <svg xmlns="http://www.w3.org/2000/svg" width="19.662" height="11.737" viewBox="0 0 19.662 11.737">
                            <g id="Group_84" data-name="Group 84" transform="translate(0 0.369)">
                                <path id="Path_194" data-name="Path 194" d="M155.775,803.688h19"
                                    transform="translate(-155.775 -798.152)" fill="none" stroke="#232448" stroke-width="1">
                                </path>
                                <path id="Path_195" data-name="Path 195" d="M168.275,783.965l6,5.5-6,5.5"
                                    transform="translate(-155.354 -783.965)" fill="none" stroke="#232448" stroke-width="1">
                                </path>
                            </g>
                        </svg>
                    </div>
                </div>
            </button>
            {{ hidden }}
        </form>
</section>


{{ end section contents }}