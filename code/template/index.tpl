{{ assign $site.is_index = true }}

{{ transclude './template/siteframe' }}

{{ include head './include/head/index' }}
{{ include foot './include/foot/index' }}

{{ section contents }}


<section class="secIndex01">
    <div class="txt">
        <h1 class="title">
            より良い未来のために
        </h1>
        <div class="subtitle">
            For a better future
        </div>
    </div>
</section>

<section class="secIndex02">
    <div class="container">
        <div class="txt">上質、信頼、根拠、確実な成果。
            私たちが目指すのは、単なる学習塾や雑貨屋、書店ではありません。
            吟味に吟味を重ねた、私たちだからこそできる、「モノとコトの融合」を様々な形でご提供します。
        </div>
    </div>
</section>

<section class="secIndex03">
    <div class="container">
        <div class="row">
            <div class="col01">
                <div class="txt">
                    <h2 class="title">『Libretto』ブランド</h2>
                    <div class="subtitle">
                        「毎日の生活が楽しくなる」「自分のお気に入りやギフトが探せるショップ」をコンセプトに、『The Libretto』や『Made in
                        TOKAI』などのブランドで、主に東海地方に出店中。
                    </div>
                    <a href="#" class="btnBasic01 btn btnBasic01O#232448">
                        <div class="txt">
                            <div class="title">
                                修正する
                            </div>
                            <div class="icon iconRight">
                                <svg xmlns="http://www.w3.org/2000/svg" width="19.662" height="11.737"
                                    viewBox="0 0 19.662 11.737">
                                    <g id="Group_84" data-name="Group 84" transform="translate(0 0.369)">
                                        <path id="Path_194" data-name="Path 194" d="M155.775,803.688h19"
                                            transform="translate(-155.775 -798.152)" fill="none" stroke="#232448"
                                            stroke-width="1"></path>
                                        <path id="Path_195" data-name="Path 195" d="M168.275,783.965l6,5.5-6,5.5"
                                            transform="translate(-155.354 -783.965)" fill="none" stroke="#232448"
                                            stroke-width="1"></path>
                                    </g>
                                </svg>
                            </div>
                        </div>
                    </a>
                </div>
            </div>
            <div class="col02">
                <img src="{{ base }}/data/img/img23@2x.png" alt="">
            </div>
        </div>
    </div>
</section>

<section class="secIndex04 secIndex04aa">
    <div class="container">
        <div class="row rowReverse">
            <div class="col01">
                <div class="txt txtRight">
                    <h2 class="title">『Libretto School』</h2>
                    <div class="subtitle">
                        『陰山式スコーラプレミア』や『mpi英語倶楽部』など、皆さまの学びをサポートしています。
                    </div>
                    <a href="#" class="btnBasic01 btn btnBasic01O#232448">
                        <div class="txt">
                            <div class="title">
                                修正する
                            </div>
                            <div class="icon iconRight">
                                <svg xmlns="http://www.w3.org/2000/svg" width="19.662" height="11.737"
                                    viewBox="0 0 19.662 11.737">
                                    <g id="Group_84" data-name="Group 84" transform="translate(0 0.369)">
                                        <path id="Path_194" data-name="Path 194" d="M155.775,803.688h19"
                                            transform="translate(-155.775 -798.152)" fill="none" stroke="#232448"
                                            stroke-width="1"></path>
                                        <path id="Path_195" data-name="Path 195" d="M168.275,783.965l6,5.5-6,5.5"
                                            transform="translate(-155.354 -783.965)" fill="none" stroke="#232448"
                                            stroke-width="1"></path>
                                    </g>
                                </svg>
                            </div>
                        </div>
                    </a>
                </div>
            </div>
            <div class="col02">
                <img src="{{ base }}/data/img/img57@2x.png" alt="" class="img imgRight">
            </div>
        </div>
    </div>
</section>

<section class="secIndex04 secIndex04aa">
    <div class="container">
        <div class="row">
            <div class="col01">
                <div class="txt txtLeft">
                    <h2 class="title">教育・防災事業</h2>
                    <div class="subtitle">
                        長年の経験と新しい試みで 学校運営の一助となるよう誠実・勤勉に取り組みます
                    </div>
                    <a href="#" class="btnBasic01 btn btnBasic01O#232448">
                        <div class="txt">
                            <div class="title">
                                修正する
                            </div>
                            <div class="icon iconRight">
                                <svg xmlns="http://www.w3.org/2000/svg" width="19.662" height="11.737"
                                    viewBox="0 0 19.662 11.737">
                                    <g id="Group_84" data-name="Group 84" transform="translate(0 0.369)">
                                        <path id="Path_194" data-name="Path 194" d="M155.775,803.688h19"
                                            transform="translate(-155.775 -798.152)" fill="none" stroke="#232448"
                                            stroke-width="1"></path>
                                        <path id="Path_195" data-name="Path 195" d="M168.275,783.965l6,5.5-6,5.5"
                                            transform="translate(-155.354 -783.965)" fill="none" stroke="#232448"
                                            stroke-width="1"></path>
                                    </g>
                                </svg>
                            </div>
                        </div>
                    </a>
                </div>
            </div>
            <div class="col02">
                <img src="{{ base }}/data/img/img58@2x.png" alt="" class="img imgLeft">
            </div>
        </div>
    </div>
</section>

<section class="secIndex05">
    <a href="#" class="box">
        <img src="{{ base }}/data/img/img59@2x.png" alt="" class="img">
        <div class="txt">
            <div class="title">
                COMPANY
            </div>
            <div class="subtitle">
                企業情報
            </div>
        </div>
    </a>
</section>


{{ end section contents }}