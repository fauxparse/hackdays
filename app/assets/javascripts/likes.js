$(function() {
  $(document).on('click', '.likes', function(e) {
    e.preventDefault();
    let target = $(e.target).closest('.likes');
    let method = 'post';

    if (target.is('[data-liked]')) {
      target.removeAttr('data-liked');
      method = 'delete';
    } else {
      target.attr('data-liked', true);
    }

    setTimeout(function() {
      $.ajax({
        url: target.data("url"),
        method: method
      }).done(function(html) { target.replaceWith(html); })
    }, 250);
  });
});
