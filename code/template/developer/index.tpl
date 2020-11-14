{{ assign $site.title = '開発者 | ' . $site.title }}
{{ assign $site.description = 'DEVELOPER | ' . $site.description }}
{{ assign $site.url = 'school/developer/' }}
{{ assign $footer_type = 'type_2' }}

{{ transclude '../template/siteframe' }}

{{ include head '../include/head/index' }}
{{ include foot '../include/foot/index' }}

{{ section contents }}

<section class="secBasic01 secBasic01developer">
    <div class="container">
        <div class="txt">
            <h1 class="title">開発者</h1>
            <div class="subtitle">DEVELOPER</div>
        </div>
    </div>
</section>

<section class="secBasic03">
    <div class="container">
        <div class="list">
            <a href="#" class="item link">TOP</a>
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
            <div class="item">開発者</div>
        </div>
    </div>
</section>

<section class="secDeveloper01">
    <div class="container">
        <div class="grid">
            <div class="col01">
                <figure class="img">
                    <img src="{{ base }}/data/img/img51@2x.png" alt="" class="pc">
                    <img src="{{ base }}/data/img/img52@2x.png" alt="" class="sp">
                </figure>
            </div>
            <div class="col02">
                <div class="txt">
                    <div class="author">
                        <div class="name01">陰山英男</div>
                        <div class="name02">かげやま ひでお</div>
                    </div>
                    <div class="intro">
                        大阪市教育委員会委員長や、安倍内閣の教育再生実行会議委員、立命館大学教育開発推進機構教授などを歴任。
                        小学校在職時の2000年10月に、その取り組みがNHK テレビ「クローズアップ現代『学校は勉強するところだ　～ある公立小学校の試み～』」で取り上げられ、大きな反響を呼ぶ。
                        「基礎・基本の徹底」と「早寝・早起き・朝ごはん」に代表される生活習慣の改善による学力向上運動に取り組む。
                        『陰山式スコーラ』の土台である陰山メソッドが生まれた朝来市立山口小学校では、国公立大学の医学部や、東大、京大への進学者が続出した。
                    </div>
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
    </div>
</section>

<section class="secSchool03 secSchool03developer">
    <div class="container">
        <div class="list">
            <a href="{{ base }}/{{ $menu_info['schola'] }}" class="item">
                <figure class="img">
                    <img src="{{ base }}/data/img/img26@2x.png" alt="" srcset="" class="pc">
                    <img src="{{ base }}/data/img/img60@2x.png" alt="" srcset="" class="sp">
                </figure>
                <div class="title">
                    陰山式スコーラプレミアについて
                </div>
            </a>
            <a href="{{ base }}/{{ $menu_info['curriculum'] }}" class="item">
                <figure class="img">
                    <img src="{{ base }}/data/img/img27@2x.png" alt="" srcset="" class="pc">
                    <img src="{{ base }}/data/img/img61@2x.png" alt="" srcset="" class="sp">
                </figure>
                <div class="title">
                    カリキュラム
                </div>
            </a>
        </div>
    </div>
</section>

{{ end section contents }}