$(".iconOpen").click(function () {
    $(".menu").slideDown("slow");
    // $('body').addClass("menu-open");

});

$(".iconClose").click(function () {
    $(".menu").slideUp("slow");
    // $('body').removeClass("menu-open");
});

$('.backTop01').on('click', function (e) {
    e.preventDefault();
    $('html, body').animate({
        scrollTop: 0
    }, '300');
});

