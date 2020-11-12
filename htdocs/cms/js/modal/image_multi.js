var Modal_multi_image = function () {
    this.prefix = "image_multi_";
    this.$target = null;
    this.$template = null;
    this.$count = "";
    this.maxsize = 0;
    this.$image_box = [];
    this._error_message = "";

    Modal_class.call(this);
};
// 継承
inherits(Modal_multi_image, Modal_class);

Modal_multi_image.prototype.set_template = function (
    $target,
    $template,
    $count,
    maxsize
) {
    this.$target = $target;
    this.$template = $template;
    this.$count = $count;
    this.maxsize = maxsize;
    this.$image_box = [];
};

Modal_multi_image.prototype.add_template = function (index) {
    var $template = $(this.$template.html());
    $template.addClass("is-loading");
    this.$target.append($template);
    this.$image_box[index] = $template;
};

Modal_multi_image.prototype.set_image = function (json) {
    if (!json.error) {
        var wrap = this.$image_box[json.index];
        wrap.removeClass("is-loading");
        wrap.find(".c-uploader-image__selected")
            .show()
            .find(".c-uploader-image__photo__figure")
            .html("")
            .append(
                $("<img>", { src: json.image_url }).addClass(
                    "c-uploader-image__photo__image"
                )
            )
            .end()
            .end()
            .find(".c-uploader-image__empty")
            .hide();

        wrap.find("input.img_val").val(json.image_id);

        this.hide();
    }
};

Modal_multi_image.prototype.check_size = function (push_size) {
    if (this.maxsize === 0) {
        return true;
    }

    var now = this.$target.find(this.$count).length;
    this._error_message =
        "最大" +
        this.maxsize +
        "個までです。現在" +
        now +
        "個、選択したファイルは" +
        push_size +
        "個です。";
    return now + push_size <= this.maxsize;
};

Modal_multi_image.prototype.check_size_error = function (push_size) {
    return this._error_message;
};

(function ($) {
    $(function () {
        $(document).on("click", "a.modal_multi_image", function () {
            if (!window.Modal_mi) window.Modal_mi = new Modal_multi_image();

            var $target = $($(this).attr("data-target"));
            var $template = $($(this).attr("data-template"));
            var $count = $(this).attr("data-count");
            var maxsize = ~~$(this).attr("data-maxsize");
            window.Modal_mi.set_template($target, $template, $count, maxsize);
            window.Modal_mi.view($(this).attr("href"));

            return false;
        });
    });
})(jQuery);
