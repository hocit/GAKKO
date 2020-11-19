var $ = jQuery.noConflict();
$(".iconOpen").click(function () {
    $(".menu").slideDown("slow");
    // $('body').addClass("menu-open");

});

$(".iconClose").click(function () {
    $(".menu").slideUp("slow");
    // $('body').removeClass("menu-open");
});

$('.backTop').on('click', function (e) {
    e.preventDefault();
    $('html, body').animate({
        scrollTop: 0
    }, '300');
});

$('#contact-form').parsley().on('form:submit', function () {
    return false; // Don't submit form for this demo
});