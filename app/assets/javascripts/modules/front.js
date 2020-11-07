$(function(){
  // ▼マウスが載ったらサブメニューを表示
  $("ul.upper-field__navigate__left-side__item li").mouseenter(function(){
     $(this).siblings().find("ul").hide();  // 兄弟要素に含まれるサブメニューを全部消す。
     $(this).children().slideDown(150);     // 自分のサブメニューを表示する。
  });
  // ▼どこかがクリックされたらサブメニューを消す
  $('html').click(function() {
     $('ul.upper-field__navigate__left-side__item ul').slideUp(150);
  });
});