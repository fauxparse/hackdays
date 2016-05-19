$(function () {
  console.log('boop');
  $(document)
    .on('click', '[rel="popup"]', function(e) {
      let target = $(e.target).closest('[rel="popup"]');
      e.preventDefault();
      target.addClass('open');
      $(document).one('click', function() {
        target.removeClass('open');
      });
    });
})
