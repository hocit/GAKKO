{{ assign $site.title = 'お問い合わせ | ' . $site.title }}
{{ assign $site.description = 'お問い合わせ | ' . $site.description }}
{{ assign $site.url = 'contact/' }}

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

        <form class="c-form" action="./confirm.html" method="post">

            <table class="c-form__table">
                <tbody class="c-form__table__tbody">
                    {{if isset($page.error)}}
                    <tr class="c-form__table__row p-contact__error is-top">
                        <th class="c-form__table__head">入力エラー</th>
                        <td class="c-form__table__data">
                            {{ foreach $page.error as $key => $value }}
                            {{ $value|noescape }}<br>
                            {{ end }}
                        </td>
                    </tr>
                    {{end}}
                    <tr class="c-form__table__row">
                        <th class="c-form__table__head">お問い合わせ内容</th>
                        <td class="c-form__table__data">
                            {{ assign $id = 'cont' }}
                            <select name="{{ $id }}" class="c-input__select">
                                <option value="">選択してください</option>
                                {{ assign $param = 'お問い合わせ' }}
                                <option value="{{ $param }}"{{ selected key=$param value=$page.data[$id] }}>{{ $param }}</option>
                                {{ assign $param = '採用について' }}
                                <option value="{{ $param }}"{{ selected key=$param value=$page.data[$id] }}>{{ $param }}</option>
                                {{ assign $param = 'その他' }}
                                <option value="{{ $param }}"{{ selected key=$param value=$page.data[$id] }}>{{ $param }}</option>
                            </select>
                        </td>
                    </tr>
                    <tr class="c-form__table__row">
                        <th class="c-form__table__head">お名前（全角）</th>
                        <td class="c-form__table__data">
                            {{ assign $id = 'name' }}
                            <input name="{{ $id }}" value="{{ $page.data[ $id ] }}" type="text" class="c-input__text is-full">
                        </td>
                    </tr>
                    <tr class="c-form__table__row">
                        <th class="c-form__table__head">フリガナ（全角カナ）</th>
                        <td class="c-form__table__data">
                            {{ assign $id = 'furi' }}
                            <input name="{{ $id }}" value="{{ $page.data[ $id ] }}" type="text" class="c-input__text is-full">
                        </td>
                    </tr>
                    <tr class="c-form__table__row">
                        <th class="c-form__table__head">貴社名</th>
                        <td class="c-form__table__data">
                            {{ assign $id = 'company' }}
                            <input name="{{ $id }}" value="{{ $page.data[ $id ] }}" type="text" class="c-input__text is-full">
                        </td>
                    </tr>
                    <tr class="c-form__table__row">
                        <th class="c-form__table__head">郵便番号</th>
                        <td class="c-form__table__data">
                            {{ assign $id = 'zip1' }}
                            <label>〒 <input name="{{ $id }}" value="{{ $page.data[ $id ] }}" type="text" class="c-input__text is-short"></label>
                            {{ assign $id = 'zip2' }}
                            <label> - <input name="{{ $id }}" value="{{ $page.data[ $id ] }}" type="text" class="c-input__text is-short"></label>
                            <button type="button" class="c-button is-small" href="javascript:void(0);" onclick="AjaxZip3.zip2addr('zip1','zip2','pref','address1');">郵便番号から検索</button>
                        </td>
                    </tr>
                    <tr class="c-form__table__row is-top">
                        <th rowspan="3" class="c-form__table__head">ご住所</th>
                        <td class="c-form__table__data">都道府県<br>
                            {{ assign $id = 'pref' }}
                            <select name="{{ $id }}" class="c-input__select">
                                <option value="">選択してください</option>
                                {{ foreach $page.contact_common.prefectures as $key => $pref }}
                                <option value="{{ $pref }}"{{ selected key=$pref value=$page.data[$id] }}>{{ $pref }}</option>
                                {{ end foreach }}
                            </select>
                        </td>
                    </tr>
                    <tr class="c-form__table__row">
                        <td class="c-form__table__data">
                            {{ assign $id = 'address1' }}
                            市区町村<br>
                            <input name="{{ $id }}" value="{{ $page.data[ $id ] }}" type="text" class="c-input__text is-full">
                        </td>
                    </tr>
                    <tr class="c-form__table__row">
                        <td class="c-form__table__data">
                            {{ assign $id = 'address2' }}
                            番地・建物名
                            <input name="{{ $id }}" value="{{ $page.data[ $id ] }}" type="text" class="c-input__text is-full">
                        </td>
                    </tr>
                    <tr class="c-form__table__row">
                        <th class="c-form__table__head">E-Mail（半角英数字記号）</th>
                        <td class="c-form__table__data">
                            {{ assign $id = 'mail' }}
                            <input name="{{ $id }}" value="{{ $page.data[ $id ] }}" type="text" class="c-input__text is-full">
                        </td>
                    </tr>
                    <tr class="c-form__table__row">
                        <th class="c-form__table__head">電話番号（半角数字）</th>
                        <td class="c-form__table__data">
                            {{ assign $id = 'tel1' }}
                            <input name="{{ $id }}" value="{{ $page.data[ $id ] }}" type="text" class="c-input__text is-short">
                            -
                            {{ assign $id = 'tel2' }}
                            <input name="{{ $id }}" value="{{ $page.data[ $id ] }}" type="text" class="c-input__text is-short">
                            -
                            {{ assign $id = 'tel3' }}
                            <input name="{{ $id }}" value="{{ $page.data[ $id ] }}" type="text" class="c-input__text is-short">
                        </td>
                    </tr>
                    <tr class="c-form__table__row is-top">
                        <th class="c-form__table__head">内容</th>
                        <td class="c-form__table__data">
                            {{ assign $id = 'body' }}
                            <textarea name="{{ $id }}" rows="5" class="c-input__text is-full">{{ $page.data[ $id ] }}</textarea>
                        </td>
                    </tr>
                </tbody>
            </table>

            <p class="p-contact__privacy-check">
                <label class="c-input__label"><input type="checkbox" name="personal" value="同意する"> 個人情報のお取り扱いについて同意する</label>
            </p>

            <ul class="p-contact__submit">
                <li class="p-contact__submit__button"><input class="c-button" type="submit" value="確認"></li>
            </ul>

            {{ hidden }}
        </form>

    </div>

{{ end section contents }}
