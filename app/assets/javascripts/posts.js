$(document).ready(function() {
  if ($(".pagination").size() > 0) {
    $(".pagination").hide();
    $("#endless-scroll").removeClass("hidden");
    $(window).bindWithDelay("scroll", function() {
      var url = $("a.next_page").attr("href");
      if (url && $(window).scrollTop() > $(document).height() - $(window).height() - 50) {
        $.getScript(url);
      }
    }, 150);
  }

  $('.input-mentionable').atwho({
    at: '@',
    data: $('#mentionable-data').data('content'),
    insertTpl: '<a href="/users/${slug}">${name}</a>',
    displayTpl: '<li data-slug="${slug}"><span>${name}</span></li>',
    limit: 15
  });

  // $('#new_post').submit(function() {
  //   $('#post_content').val($('#post-content').html());
  //   $('#post-content').html('');
  // });
});
