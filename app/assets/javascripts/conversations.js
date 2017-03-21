$(document).ready(function() {

  $('form#new_message').on('submit', function(event) {
    event.preventDefault();

    $.ajax({
      url: $(this).attr('action'),
      method: $(this).attr('method'),
      data: $(this).serialize()
    }).done(function() {
      console.log('success');
      $('textarea#body').val('');
    });

    return false;
  });


});
