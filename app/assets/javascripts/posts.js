$(document).ready(function() {
  $('#create-post-link').on("click", function(e){
    e.preventDefault();

    $target = e.target;

    $.ajax({url: $target.href,
      method: "get"
    })
    .done(function(response){
      $("#create-new-post-area").append(response);
      $($target).hide();
    })
    .fail(function(e){
      console.log(error);
    });
  });

  $("#create-new-post-area").on("submit", "#form-post", function(e){
    e.preventDefault();

    $target = e.target;

    $.ajax({
      url: $($target).attr('action'),
      method: "post",
      data: $($target).serialize()
    }).done(function(response){
      $("#form-post").remove();
      $(".posts-container").prepend(response);
      $('#create-post-link').show();
    });
  });

});