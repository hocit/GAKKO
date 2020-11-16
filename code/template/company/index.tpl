{{ assign $site.title = '会社情報 | 株式会社学校良品' }}
{{ assign $site.description = 'モノとコトの融合を様々な形で提供する学校良品の会社情報。' }}
{{ assign $site.url = 'company/' }}
{{ assign $footer_type = 'type_1' }}

{{ transclude '../template/siteframe' }}

{{ include head '../include/head/index' }}
{{ include foot '../include/foot/index' }}

{{ section contents }}


<section class="secBasic01 secBasic01company">
    <div class="container">
        <div class="txt">
            <h1 class="title">企業情報</h1>
            <div class="subtitle">COMPANY</div>
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
            <div class="item">企業情報</div>
        </div>
    </div>
</section>

<section class="secCompany01 secCompany01aa">
    <h2 class="ttl">
        会社概要
    </h2>
    <div class="contact">
        <div class="list">
            <div class="item">
                <div class="left">
                    会社名
                </div>
                <div class="right">
                    株式会社学校良品
                </div>
            </div>
            <div class="item">
                <div class="left">
                    設立
                </div>
                <div class="right">
                    平成29年7月
                </div>
            </div>
            <div class="item">
                <div class="left">
                    代表者
                </div>
                <div class="right">
                    森 和茂
                </div>
            </div>
            <div class="item">
                <div class="left">
                    本社所在地
                </div>
                <div class="right">
                    〒461‐0002<br>
                    愛知県名古屋市東区代官町34番15号<br>
                    TEL（052）931‐0400　／　FAX（052）932‐2878<br>
                </div>
            </div>
            <div class="item">
                <div class="left">
                    事業内容
                </div>
                <div class="right">
                    ・書籍、文具、雑貨などの販売<br>
                    ・各種教室の運営<br>
                    ・防災用品、学校教材・教具の販売<br>
                    ・各種検定の取扱い<br>
                    ・教育全般に関するワークショップの企画・運営<br>
                    ・ICT教育、教材導入サポートおよび、販売<br>
                    ・その他、学校運営にかかわる支援業務<br>
                </div>
            </div>
        </div>
    </div>
</section>


{{ end section contents }}