$(function () {
  
  $('.listing input[type=submit]').on('click', function() {
    $(this).parent().parent().toggleClass('card-claimed');
  });

});
