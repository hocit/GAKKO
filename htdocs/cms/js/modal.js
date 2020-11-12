var Modal_class = function () {
    if (!this.prefix) {
        this.prefix = "default_";
    }

    this.modal = $("<div>", {
        id: this.prefix + "modal_box",
        class: "c-modal-box",
    })
        .append(
            $("<iframe>", { frameborder: 0 }).addClass("c-modal-box__content")
        )
        .appendTo("body");

    this.w = { ih: 0, oh: 0 };
    this.pad = 50;
    this.resize();
};

Modal_class.prototype.view = function (url, width, height) {
    var that = this;

    if (!width) width = "100%";
    if (!height) height = "100%";

    this.resize();
    this.modal
        .find(".c-modal-box__content")
        .width(width)
        .height(height)
        .attr("src", url)
        .load(function () {
            that.modal.show();
        });
};

Modal_class.prototype.fit = function (height) {
    if ($(window).width() <= 768) {
        this.modal.find("iframe").height(height);
    }
};

Modal_class.prototype.hide = function () {
    this.modal.hide();
};

Modal_class.prototype.resize = function () {
    this.w.oh = Math.max.apply(null, [
        document.body.clientHeight,
        document.body.scrollHeight,
        document.documentElement.scrollHeight,
        document.documentElement.clientHeight,
    ]);
    this.w.ih =
        window.innerHeight ||
        document.documentElement.clientHeight ||
        document.body.clientHeight;
};

window.Modal = null;
(function ($) {
    $(function () {
        $("a.modal").click(function () {
            if (!window.Modal) window.Modal = new Modal_class();

            window.Modal.view(
                $(this).attr("href"),
                $(this).data("width"),
                $(this).data("height")
            );

            return false;
        });
    });
})(jQuery);
