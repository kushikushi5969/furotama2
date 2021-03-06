// 新規投稿時、レビューの文字数カウント
function countLength(text, field) {
  document.getElementById(field).innerHTML = text.length + "/150";
}
