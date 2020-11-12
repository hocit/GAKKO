(function ($) {
    $(function () {
        $("a.link-alert").click(function () {
            console.log($(this).attr("data-message"));
            return window.confirm($(this).attr("data-message"));
        });

        /**
         * fixedmenu制御
         */
        if ($(".fixed-menu").length) {
            var _h = 0;
            $(".fixed-menu").each(function () {
                var h = $(this).outerHeight();
                if (h > _h) {
                    _h = h;
                }
            });
            $("#wrap").css("padding-bottom", _h + 10);
        }

        /**
         * SPサイドメニュー
         */
        $("#side-toggle").on("click", function () {
            $("html").toggleClass("has-side");
            return false;
        });
    });
})(jQuery);

/**
 * クラスの継承
 * via : http://qiita.com/LightSpeedC/items/d307d809ecf2710bd957
 */
function inherits(ctor, superCtor) {
    ctor.super_ = superCtor;
    if (typeof Object.create === "function") {
        ctor.prototype = Object.create(superCtor.prototype, {
            constructor: {
                value: ctor,
                enumerable: false,
                writable: true,
                configurable: true,
            },
        });
    } else {
        var TempCtor = function () {};
        TempCtor.prototype = superCtor.prototype;
        ctor.prototype = new TempCtor();
        ctor.prototype.constructor = ctor;
    }
}
