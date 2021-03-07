// 新規投稿時、レビューの文字数カウント
window.countLength = countLength;
function countLength() {
  var textValue = document.getElementById("post_review").value;
  var textLength = textValue.length;
  document.getElementById("text-length").innerHTML = textLength + "/150";
}
