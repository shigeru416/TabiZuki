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
  $('.bxslider1').bxSlider({
    slideWidth: 800, 
    pager: false,  
    speed: 2000,
    pause: 6000,  
    auto: true,
    randomStart: true, 
    autoHover: true
  });
});