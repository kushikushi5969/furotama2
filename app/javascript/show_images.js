// 投稿詳細ページの画像表示
$(document).on('turbolinks:load', function () {
  $('.main-img-slider').slick({
    arrows: false,
    asNavFor: '.thumb-img-slider'
  });
  $('.thumb-img-slider').slick({
    asNavFor: '.main-img-slider',
    focusOnSelect: true,
    slidesToShow: 5,
    slidesToScroll: 1,
    swipe: true,
    responsive: [
      {
        breakpoint: 1240,
        settings: {
          slidesToShow: 4,
        }
      },
      {
        breakpoint: 999,
        settings: {
          slidesToShow: 4,
        }
      },
      {
        breakpoint: 490,
        settings: {
          slidesToShow: 2,
        }
      },
    ]
  });
});
