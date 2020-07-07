// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require jquery3
//= require jquery
//= require bxslider
//= require popper
//= require bootstrap-sprockets
//= require_tree .

/*トップに戻るボタン*/
$(document).ready(function() {
 
  $('#back a').on('click',function(event){
    $('body, html').animate({
      scrollTop:0
    }, 600);
    event.preventDefault();
  });
 
});


/*ユーザー・管理者新規登録、ログインスライダー*/
$(document).ready(function(){
  $('.bxslider').bxSlider({
    auto: true,            // 自動スライド
    speed: 3000,           // スライドするスピード
    moveSlides: 1,         // 移動するスライド数
    pause: 6000,           // 自動スライドの待ち時間
    maxSlides: 1,          // 一度に表示させる最大数
    slideWidth: 700,       // 各スライドの幅
	  randomStart: true,     // 最初に表示するスライドをランダムに設定
    autoHover: true,       // ホバー時に自動スライドを停止
    mode: 'fade',          // スライド切り替わり時の変化
    controls: false        // 矢印消す
  });
});

/*投稿詳細スライドショー*/
$(document).ready(function(){
  $('.bxslider1').bxSlider({
    auto: false,           // 自動スライド
    speed: 1000,           // スライドするスピード
    moveSlides: 1,         // 移動するスライド数
    maxSlides: 1,          // 一度に表示させる最大数
    mode: 'fade',          // スライド切り替わり時の変化
    adaptiveHeight:true
  });
});
