// アコーディオンメニュー（サイドサブ）
$(document).on('turbolinks:load', function () {
  $('#nav-toggle').on('click', function () {
    $('body').toggleClass('close');
  });

  $('.scroll').perfectScrollbar();
});
