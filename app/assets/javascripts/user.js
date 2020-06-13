//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require jquery3
//= require jquery
//= require bxslider
//= require popper
//= require bootstrap-sprockets
//= require_tree .

$(document).ready(function(){
  $('.bxslider').bxSlider({
    auto: true,            // 自動スライド
    speed: 3000,           // スライドするスピード
    moveSlides: 1,         // 移動するスライド数
    pause: 6000,           // 自動スライドの待ち時間
    maxSlides: 1,          // 一度に表示させる最大数
    slideWidth: 700,      // 各スライドの幅
	randomStart: true,     // 最初に表示するスライドをランダムに設定
    autoHover: true,       // ホバー時に自動スライドを停止
    mode: 'fade',          
    controls: false        // 矢印消す
  });
});