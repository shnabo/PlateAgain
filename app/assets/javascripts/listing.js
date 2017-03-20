
// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/

$(function () {

  $('.listing input[type="submit"]').on('click', function() {
          // event.preventDefault()
          // $(this).toggleClass('green');
          $('.listing').toggleClass('card-claimed');


          //$().click(function(){
  //$(this).text(function(i, v){
     //return v === 'claim' ? 'uncliam' : 'claim'
  //});
  });
});

  //});
//});
