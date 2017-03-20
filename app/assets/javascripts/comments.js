$(document).ready(function() {

  // disable review submission if empty
  var reviewSubmit = $('#new_comment > input[type="submit"]');
  var commentInput = $('#comment_comments');

  function disableSubmitReview() {
    reviewSubmit.attr('disabled', 'disabled');
  }

  disableSubmitReview();

  commentInput.on('keyup', function() {
    if (commentInput.val() === "") {
      disableSubmitReview();
    } else {
      reviewSubmit.removeAttr('disabled');
    }
  });

  // post review to page instantly
  $('form#new_comment').on('submit', function(event) {
    event.preventDefault();

    $.ajax({
      url: $(this).attr('action'),
      method: $(this).attr('method'),
      data: $(this).serialize()
    }).done(function() {
      commentInput.val('');
    });

  });
  return false;


});
