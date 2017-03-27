$(document).ready(function() {
  $('#show-post-page-comment-link').on("click", function(e) {
    e.preventDefault();

    var target = e.target;
    var jqTarget = $(target);

    $.ajax({
      url: target.href,
      method: 'get'
    })
    .done(function(response) {
      jqTarget.hide();
      $('#show-post').after(response);
      jqTarget.show();
    })
    .fail(function(e){
      console.log(error);
    });
  });

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

    $('.one-post').on("click", '#add-comment-link', function(e) {
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
    });

    $('.one-post').on("submit", "#comment-form", function(e){
      e.preventDefault();

      var target = e.target;
      var jqTarget = $(target);

      $.ajax({
        url: target.action,
        method: 'post',
        data: jqTarget.serialize()
      })
      .done(function(response) {
        jqTarget.hide();
        $('#all-comments-container').append(response);
        $('#add-comment-link').show();
      });
    });


});
