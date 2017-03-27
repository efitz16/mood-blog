$(document).ready(function() {
  // $('#post-comments-link').on("click", function(e) {
  //   e.preventDefault();

  //   var target = e.target;

  //   $.ajax({
  //     url: target.href,
  //     method: 'get'
  //   })
  //   .done(function(response) {
  //     $(target).hide();
  //     $('.posts-container').after(response);


  //   })
  //   .fail(function(e){
  //     console.log(error);
  //   });
  // });

    $('#add-comment-link').on("click", function(e) {
      e.preventDefault();

      var target = e.target;
      var jqTarget = $(target);

      $.ajax({
        url: target.href,
        method: 'get'
      })
      .done(function(response) {
        jqTarget.hide();
        $('.comment-form-container-ajax').prepend(response);
      });
    });

    // submit form

    $('.comment-form-container-ajax').on("submit", "#comment-form", function(e){
      e.preventDefault();

      var target = e.target;
      var jqTarget = $(target);

      $.ajax({
        url: target.href,
        method: 'post',
        data: jqTarget.serialize()
      })
      .done(function(response) {
        jqTarget.hide();
        $('#all-comments-container').append(response);
        $('#add-comment-link').show();
      });
    })


});
