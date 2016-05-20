$(function() {
  $('.pitching-form').each(function() {
    let form = $(this);
    form.find('select').chosen();

    form.on('submit', function(e) {
      e.preventDefault();
      $.post(form.attr('action'), form.serialize())
        .done(function(html) {
          $('.other-projects .goals').prepend(html);
          form[0].reset();
          form.find('select').trigger("chosen:updated");
          form.find('.search-field input')[0].focus();
          form.find('[type=submit]').removeAttr('disabled');
        });
    });
  });
});
