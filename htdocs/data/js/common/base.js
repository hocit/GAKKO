(function ($) {
    $(function () {
        $('a img[src*="_off."], input[src*="_off."]').rollOver();
        $('a[href^="#"]').smScroll();
    });

    /**
     * SP Nav Trigger
     */
    $(function () {
        var $html = $("html");
        $(".l-nav__trigger__button").on("click", function () {
            $html.toggleClass("is-nav-view");
        });
    });
})(jQuery);
