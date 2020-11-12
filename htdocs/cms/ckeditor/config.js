/**
 * @license Copyright (c) 2003-2013, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see LICENSE.html or http://ckeditor.com/license
 */

CKEDITOR.editorConfig = function (config) {
    // Define changes to default configuration here. For example:
    // config.language = 'fr';
    // config.uiColor = '#AADC6E';

    // エンターキーをbrタグに
    config.enterMode = CKEDITOR.ENTER_BR;
    config.allowedContent = true;

    config.extraPlugins = "colorbutton,colordialog,font,justify,autogrow";

    // config.toolbar = [
    //     { name: 'clipboard', groups: [ 'clipboard', 'undo' ], items: [ 'Cut', 'Copy', 'Paste', 'PasteText', 'PasteFromWord', '-', 'Undo', 'Redo' ] },
    //     { name: 'links', items: [ 'Link', 'Unlink', 'Anchor' ] },
    //     // { name: 'insert', items: [ 'Image', 'Flash', 'Table', 'HorizontalRule', 'Smiley', 'SpecialChar', 'PageBreak', 'Iframe' ] },
    //     { name: 'insert', items: [ 'Image', 'Table', 'HorizontalRule' ] },
    //     { name: 'tools', items: [ 'Maximize', 'ShowBlocks' ] },
    //     { name: 'source', items: [ 'Source' ] },
    //     '/',
    //     { name: 'basicstyles', groups: [ 'basicstyles', 'cleanup' ], items: [ 'Bold', 'Italic', 'Underline', 'Strike', '-', 'RemoveFormat' ] },
    //     { name: 'paragraph', groups: [ 'list', 'indent', 'blocks', 'align', 'bidi' ], items: [ 'NumberedList', 'BulletedList', '-', 'JustifyLeft', 'JustifyCenter', 'JustifyRight' ] },
    //     { name: 'styles', items: [ 'FontSize' ] },
    //     { name: 'colors', items: [ 'TextColor', 'BGColor' ] },
    //     { name: 'others', items: [ '-' ] },
    //     { name: 'about', items: [ 'About' ] }
    // ];
    config.format_tags = "p;h2;h3;h4;div";
    config.toolbar = [
        { name: "styles", items: ["Format", "FontSize"] },
        {
            name: "basicstyles",
            groups: ["basicstyles", "cleanup"],
            items: [
                "Bold",
                "Italic",
                "Underline",
                "Strike",
                "-",
                "RemoveFormat",
            ],
        },
        {
            name: "paragraph",
            groups: ["list", "indent", "blocks", "align", "bidi"],
            items: [
                "NumberedList",
                "BulletedList",
                "-",
                "JustifyLeft",
                "JustifyCenter",
                "JustifyRight",
            ],
        },
        { name: "links", items: ["Link", "Unlink", "Anchor", "toc"] },
        { name: "insert", items: ["Image", "Youtube"] },
        { name: "colors", items: ["TextColor", "BGColor"] },
        { name: "source", items: ["Source"] },
        { name: "others", items: ["-"] },
        { name: "about", items: ["About"] },
    ];

    config.filebrowserImageBrowseUrl = "/cms/image?from=wysiwyg"; //?type=images';
    config.filebrowserBrowseUrl = "/cms/media?from=wysiwyg"; //?type=images';
    // config.filebrowserWindowWidth = 840;
    // config.filebrowserWindowHeight = 700;
};
