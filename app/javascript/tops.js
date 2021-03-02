// トップページの背景画像ランダム切り替え
$(document).on('turbolinks:load', function () {
  $('.top-ctr').bgSwitcher({
    images: ['onsen002.jpg', 'onsen003.jpg', 'onsen004.jpg', 'onsen005.jpg', 'onsen006.jpg', 'onsen007.jpg'],
    interval: 4000,
    loop: true,
    shuffle: true,
    effect: "fade",
    duration: 1500,
    easing: "linear",
  });
});

// window.onload = function () {
//   alert("hoge");
// };
