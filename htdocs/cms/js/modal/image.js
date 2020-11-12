window.img_target = null;

var Modal_image = function () {
    this.prefix = "image_";

    Modal_class.call(this);
};
// 継承
inherits(Modal_image, Modal_class);

Modal_image.prototype.set_image = function (image_id, image_url) {
    if (window.img_target) {
        var wrap = window.img_target.closest(".c-uploader-image");
        wrap.find(".c-uploader-image__selected")
            .show()
            .find(".c-uploader-image__photo__figure")
            .html("")
            .append(
                $("<img>", { src: image_url }).addClass(
                    "c-uploader-image__photo__image"
                )
            )
            .end()
            .end()
            .find(".c-uploader-image__empty")
            .hide();

        wrap.find("input.img_val").val(image_id);

        this.hide();
    }
};
Modal_image.prototype.set_change = function () {
    if (window.img_target) {
        var wrap = window.img_target.closest(".c-uploader-image");
        wrap.find(".c-uploader-image__selected")
            .hide()
            .find(".c-uploader-image__photo__figure")
            .html("")
            .end()
            .end()
            .find(".c-uploader-image__empty")
            .show();

        wrap.find("input.img_val").val(0);

        this.hide();
    }
};

(function ($) {
    $(function () {
        $(document).on("click", "a.modal_image", function () {
            if (!window.Modal_i) window.Modal_i = new Modal_image();

            window.img_target = $(this);
            window.Modal_i.view($(this).attr("href"));

            return false;
        });
        $(document).on("click", "a.delete_image", function () {
            if (!window.Modal_i) window.Modal_i = new Modal_image();

            window.img_target = $(this);
            window.Modal_i.set_change();

            return false;
        });
        $(".c-uploader-image").each(function () {
            if (~~$(this).find("input.img_val").val() > 0) {
                $(this)
                    .find(".c-uploader-image__empty")
                    .hide()
                    .end()
                    .find(".c-uploader-image__selected")
                    .show();
            } else {
                $(this)
                    .find(".c-uploader-image__empty")
                    .show()
                    .end()
                    .find(".c-uploader-image__selected")
                    .hide();
            }
        });
    });
})(jQuery);
