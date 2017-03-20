$(document).ready(function() {
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

});


// reviewSubmit.on('submit', function(event) {
//   event.preventDefault();
//   $('.comment-list').append();
// });
