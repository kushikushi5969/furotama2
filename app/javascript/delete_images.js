// 画像プレビュー削除
$(document).on("click", '.image-preview-btn', function () {

  //要素取得
  $ul = $("#previews");
  $li = $(this).parents(".image-preview");

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

  //対象の画像の"$li"を選択し削除
  var target_li = $(this).parent().parent()
  target_li.remove();

  //preview数を取得
  $lis = $ul.find(".image-preview");

  //preview数に応じて、inputのサイズを更新・追加（レスポンシブ対応）
  var mediaQuery = matchMedia('(max-width: 490px)');
  handle(mediaQuery);
  mediaQuery.addListener(handle);
  function handle(mq) {
    if (mq.matches) {
      if ($lis.length == 0) {
        $("#previews li:last-child").css({
          width: `100%`,
        });
      }
      else if ($lis.length == 1) {
        $("#previews li:last-child").css({
          width: `calc(100% - 165px)`,
        });
      }
      else if ($lis.length == 2) {
        $("#previews li:last-child").css({
          width: `100%`,
        });
      }
      else if ($lis.length == 3) {
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
      if ($lis.length <= 3) {
        $("#previews li:last-child").css({
          width: `calc(100% - (20% * ${$lis.length}))`,
        });
      }
      else if ($lis.length == 4) {
        $ul.append(append_input);
        $("#previews li:last-child").css({
          width: `calc(100% - (20% * ${$lis.length}))`,
        });
      }
    };
  };
});
