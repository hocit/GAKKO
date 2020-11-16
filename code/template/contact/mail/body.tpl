-----------------------------
ご入力内容
-----------------------------

■お問い合わせ種別：{{ if isset($page.data.type[0]) }}{{ $page.data.type[0] }}{{ end }}{{ if isset($page.data.type[1]) }}, {{ $page.data.type[1] }}{{ end }}{{ if isset($page.data.type[2]) }}, {{ $page.data.type[1] }}{{ end }}

■お子様のお名前　    ：{{ $page.data.child_name }}
■ふりがな　　　　    ：{{ $page.data.child_name_phonetic }}
■お子様の年齢・学年：{{ $page.data.age }}

■保護者のお名前　：{{ $page.data.parent_name }}
■ふりがな　　　　：{{ page.data.parent_name_phonetic }}

■メールアドレス    ：{{ $page.data.email }}
■ご住所　：{{ $page.data.address }}
■お電話番号   ：{{ $page.data.tel }}

■お問い合わせ内容：
{{ $page.data.content }}



