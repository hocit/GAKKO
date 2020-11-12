{{ assign $site.title = 'お問い合わせ [確認] | ' . $site.title }}
{{ assign $site.description = 'お問い合わせ [確認] | ' . $site.description }}
{{ assign $site.url = 'contact/confirm.html' }}

{{ transclude '../template/siteframe' }}

{{ include head './include/head/input' }}
{{ include foot './include/foot/input' }}

{{ section contents }}

<div class="c-headline">
    <div class="u-layout">
        <h1 class="c-headline__text">お問い合わせ</h1>
        <p class="c-headline__catch">Contact</p>
    </div>
</div>

<div class="c-topic-path">
    <div class="u-layout">
        <ul class="c-topic-path__row">
            <li class="c-topic-path__col"><a href="{{ base }}/">ホーム</a></li>
            <li class="c-topic-path__col"><span>お問い合わせ</span></li>
        </ul>
    </div>
</div>

    <div class="u-layout p-contact">

        <form class="c-form" action="./post" method="post">

            <table class="c-form__table">
                <tbody class="c-form__table__tbody">
                    <tr class="c-form__table__row">
                        <th class="c-form__table__head">お問い合わせ内容</th>
                        <td class="c-form__table__data">
                            {{ assign $id = 'cont' }}
                            {{ $page.data[ $id ] }}
                        </td>
                    </tr>
                    <tr class="c-form__table__row">
                        <th class="c-form__table__head">お名前（全角）</th>
                        <td class="c-form__table__data">
                            {{ assign $id = 'name' }}
                            {{ $page.data[ $id ] }}
                        </td>
                    </tr>
                    <tr class="c-form__table__row">
                        <th class="c-form__table__head">フリガナ（全角カナ）</th>
                        <td class="c-form__table__data">
                            {{ assign $id = 'furi' }}
                            {{ $page.data[ $id ] }}
                        </td>
                    </tr>
                    <tr class="c-form__table__row">
                        <th class="c-form__table__head">貴社名</th>
                        <td class="c-form__table__data">
                            {{ assign $id = 'company' }}
                            {{ $page.data[ $id ] }}
                        </td>
                    </tr>
                    <tr class="c-form__table__row">
                        <th class="c-form__table__head">郵便番号</th>
                        <td class="c-form__table__data">
                            〒 {{ $page.data.zip1 }} - {{ $page.data.zip2 }}
                        </td>
                    </tr>
                    <tr class="c-form__table__row is-top">
                        <th rowspan="3" class="c-form__table__head">ご住所</th>
                        <td class="c-form__table__data">
                            {{ assign $id = 'pref' }}
                            {{ $page.data[ $id ] }}
                        </td>
                    </tr>
                    <tr class="c-form__table__row">
                        <td class="c-form__table__data">
                            {{ assign $id = 'address1' }}
                            {{ $page.data[ $id ] }}
                        </td>
                    </tr>
                    <tr class="c-form__table__row">
                        <td class="c-form__table__data">
                            {{ assign $id = 'address2' }}
                            {{ $page.data[ $id ] }}
                        </td>
                    </tr>
                    <tr class="c-form__table__row">
                        <th class="c-form__table__head">E-Mail（半角英数字記号）</th>
                        <td class="c-form__table__data">
                            {{ assign $id = 'mail' }}
                            {{ $page.data[ $id ] }}
                        </td>
                    </tr>
                    <tr class="c-form__table__row">
                        <th class="c-form__table__head">電話番号（半角数字）</th>
                        <td class="c-form__table__data">
                            {{ $page.data.tel1 }} - {{ $page.data.tel2 }} - {{ $page.data.tel3 }}
                        </td>
                    </tr>
                    <tr class="c-form__table__row is-top">
                        <th class="c-form__table__head">内容</th>
                        <td class="c-form__table__data">
                            {{ assign $id = 'body' }}
                            {{ $page.data[ $id ]|br }}
                        </td>
                    </tr>
                </tbody>
            </table>

            <ul class="p-contact__submit">
                <li class="p-contact__submit__button"><a class="c-button" href="./">戻る</a></li>
                <li class="p-contact__submit__button"><input class="c-button" type="submit" value="送信" /></li>
            </ul>

            {{ hidden }}
        </form>

    </div>

{{ end section contents }}
