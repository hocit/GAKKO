window.file_target = null;

var Modal_file = function () {
    this.prefix = "file_";

    Modal_class.call(this);
};
// 継承
inherits(Modal_file, Modal_class);

Modal_file.prototype.set_file = function (file_id, file_url) {
    if (window.file_target) {
        var wrap = window.file_target.closest(".c-uploader-file");
        wrap.find(".c-uploader-file__selected")
            .show()
            .find(".c-uploader-file__file")
            .html("")
            .append(
                $("<a>", {
                    href: file_url,
                    class: "c-button is-small is-default",
                    target: "_blank",
                }).text("プレビュー")
            )
            .end()
            .end()
            .find(".c-uploader-file__empty")
            .hide();

        wrap.find("input.file_val").val(file_id);

        this.hide();
    }
};
Modal_file.prototype.set_change = function () {
    if (window.file_target) {
        var wrap = window.file_target.closest(".c-uploader-file");
        wrap.find(".c-uploader-file__selected")
            .hide()
            .find(".c-uploader-file__file")
            .html("")
            .end()
            .end()
            .find(".c-uploader-file__empty")
            .show();

        wrap.find("input.file_val").val(0);

        this.hide();
    }
};

(function ($) {
    $(function () {
        $(document).on("click", "a.modal_file", function () {
            if (!window.Modal_f) window.Modal_f = new Modal_file();

            window.file_target = $(this);
            window.Modal_f.view($(this).attr("href"), 769, "100%");

            return false;
        });
        $(document).on("click", "a.delete_file", function () {
            if (!window.Modal_f) window.Modal_f = new Modal_file();

            window.file_target = $(this);
            window.Modal_f.set_change();

            return false;
        });
        $(".c-uploader-file").each(function () {
            if (~~$(this).find("input.file_val").val() > 0) {
                $(this)
                    .find(".c-uploader-file__empty")
                    .hide()
                    .end()
                    .find(".c-uploader-file__selected")
                    .show();
            } else {
                $(this)
                    .find(".c-uploader-file__empty")
                    .show()
                    .end()
                    .find(".c-uploader-file__selected")
                    .hide();
            }
        });
    });
})(jQuery);
