// EPIC VIDEO MODAL
$('.activateModal').on('click', function () {
    $('#videoOverlay').addClass('active');
  });
  
  $('.cancelModal').on('click', function () {
    $('#videoOverlay').removeClass('active');
  });

// SKIP THE BORING SHIZZLE BUTTON
$("#skipButton").click(function() {
    $('html, body').animate({
        scrollTop: $("#result").offset().top
    }, 1600);
});

// NAVBAR ACTIVE STATE
$(".navbar a").on("click", function(){
    $(".navbar").find(".active").removeClass("active");
    $(this).parent().addClass("active");
 });

 // NAVBAR LINKS
$("#introLink").click(function() {
    $('html, body').animate({
        scrollTop: $("#intro").offset().top
    }, 800);
});
$("#challengeLink").click(function() {
    $('html, body').animate({
        scrollTop: $("#challenge").offset().top
    }, 800);
});
$("#keyToSuccessLink").click(function() {
    $('html, body').animate({
        scrollTop: $("#keyToSuccess").offset().top
    }, 800);
});
$("#contextLink").click(function() {
    $('html, body').animate({
        scrollTop: $("#context").offset().top
    }, 800);
});
$("#researchLink").click(function() {
    $('html, body').animate({
        scrollTop: $("#research").offset().top
    }, 800);
});
$("#conceptingLink").click(function() {
    $('html, body').animate({
        scrollTop: $("#concepting").offset().top
    }, 800);
});
$("#problemStatementLink").click(function() {
    $('html, body').animate({
        scrollTop: $("#problemStatement").offset().top
    }, 800);
});
$("#resultLink").click(function() {
    $('html, body').animate({
        scrollTop: $("#result").offset().top
    }, 800);
});
$("#motionMatrixLink").click(function() {
    $('html, body').animate({
        scrollTop: $("#motionMatrix").offset().top
    }, 800);
});
$("#prototypingLink").click(function() {
    $('html, body').animate({
        scrollTop: $("#prototyping").offset().top
    }, 800);
});
$("#testingLink").click(function() {
    $('html, body').animate({
        scrollTop: $("#testing").offset().top
    }, 800);
});
$("#caseVideoLink").click(function() {
    $('html, body').animate({
        scrollTop: $("#caseVideo").offset().top
    }, 800);
});

// FADEIN ON LOAD
$(document).ready(function () {
    $('div.hidden').fadeIn(1200).removeClass('hidden');
});



$(document).ready(function() {
    /* Every time the window is scrolled ... */
    $(window).scroll( function(){
        /* Check the location of each desired element */
        $('.fadeIn').each( function(i){
            // var bottom_of_object = $(this).position().top + $(this).outerHeight();
            var bottom_of_object = $(this).position().top + 150;
            // var bottom_of_object = $(this).position().top;
            var bottom_of_window = $(window).scrollTop() + $(window).height();
            /* If the object is completely visible in the window, fade it it */
            if( bottom_of_window > bottom_of_object ){
                $(this).animate({'opacity':'1'},1200);
            }
        });
    });
});