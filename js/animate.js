$('.activateModal').on('click', function () {
    $('#videoOverlay').addClass('active');
  });
  
  $('.cancelModal').on('click', function () {
    $('#videoOverlay').removeClass('active');
  });

$("#skipButton").click(function() {
    $('html, body').animate({
        scrollTop: $("#result").offset().top
    }, 1600);
});


// $(document).ready(function () {
//     $('div.hidden').fadeIn(800).removeClass('hidden');
// });