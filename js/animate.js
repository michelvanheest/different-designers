$(document).ready(function () {
    $('div.hidden').fadeIn(800).removeClass('hidden');
});

$('#scroll-to').on('click', function(e){
    e.preventDefault();
    var target= $(this).get(0).id == 'scroll-to' ? $('#sec') : $('#scroll-to');
    $('html, body').stop().animate({
       scrollTop: target.offset().top
    }, 600);
});

$(function() {
    $(window).scroll( function(){
        $('.interested-floating-container').each( function(i){
            var bottom_of_object = $(this).position().top + 500;
            var bottom_of_window = $(window).scrollTop() + $(window).height();
            if( bottom_of_window > bottom_of_object ){
                $(this).animate({'opacity':'1'},800);
            }
        });
    });
});