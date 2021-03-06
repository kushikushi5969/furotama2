$(document).on('turbolinks:load', function () {
  $('#show-tabs a[href^="#panel"]').click(function () {
    $('#show-tabs .panel').hide();
    $('#show-tabs a').removeClass('active');
    $(this).toggleClass('active');
    $(this.hash).fadeIn();
    return false;
  });
  $('#show-tabs a[href^="#panel"]:eq(0)').trigger('click');
});

