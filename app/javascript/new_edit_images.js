// 画像プレビュー表示
$(function () {

  $(document).on("click", ".image_upload", function () {

    //要素取得
    $ul = $("#previews");
    $li = $(this).parents(".input");
    $label = $(this).parents(".upload-lab");
    $inputs = $ul.find(".image_upload");

    //$liに追加するためのプレビュー画面のHTML
    var preview = $(
      `<div class="image-preview__wrapper">
        <img class="preview" height="140" width="140">
        <div class="btn image-preview-btn">
          削除
        </div>
      </div>`
    );

    //次の画像を読み込むためのinput。処理の最後にappendで追加
    var append_input = $(
      `<li class="input">
        <label class="upload-lab">
          <div class="upload-lab-text">
            <i class="fas fa-images"></i>
            <br>
            <p class="up-text">写真を追加</p>
            <div class="input-box">
              <input class="hidden image_upload" type="file">
            </div>
          </div>
        </label>
      </li>`
    );

    //inputに画像を読み込んだら、"プレビューの追加"と"新しいli追加"処理が動く
    $(".image_upload").on("change", function (e) {
      var reader = new FileReader();
      reader.readAsDataURL(e.target.files[0]);
      reader.onload = function (e) {
        $(preview).find(".preview").attr("src", e.target.result);
      };
      $li.append(preview);

      //inputを非表示。プレビューのみ表示。
      $label.css("display", "none");
      $li.removeClass("input");
      $li.addClass("image-preview");
      $lis = $ul.find(".image-preview");
      $("#previews li").css({
        width: `155px`,
      });

      //"ul"に新しい"li(inputボタン)"を追加させる。
      //"ls"のレスポンシブ対応
      var mediaQuery = matchMedia('(max-width: 490px)');
      handle(mediaQuery);
      mediaQuery.addListener(handle);
      function handle(mq) {
        if (mq.matches) {
          if ($lis.length == 1) {
            $ul.append(append_input);
            $("#previews li:last-child").css({
              width: `calc(100% - 165px)`,
            });
          }
          else if ($lis.length == 2) {
            $ul.append(append_input);
            $("#previews li:last-child").css({
              width: `100%`,
            });
          }
          else if ($lis.length == 3) {
            $ul.append(append_input);
            $("#previews li:last-child").css({
              width: `calc(100% - 165px)`,
            });
          }
          else if ($lis.length == 4) {
            $ul.append(append_input);
            $("#previews li:last-child").css({
              width: `100%`,
            });
          }
        }
        else {
          if ($lis.length <= 4) {
            $ul.append(append_input);
            $("#previews li:last-child").css({
              width: `calc(100% - (20% * ${$lis.length}))`,
            });
          };
        };
      };

      //inputの最後の"data-image"を取得して、input nameの番号を更新させてる。
      $inputs.each(function (num, input) {
        //nameの番号を更新するために、現在の番号を除去
        $(input).removeAttr("name");
        $(input).attr({
          name: "post[images_attributes][" + num + "][image]",
          id: "post_images_attributes_" + num + "_image",
        });
      });
    });
  });
});
