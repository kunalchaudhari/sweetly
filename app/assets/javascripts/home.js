// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
designers = ["Pritiben", "Rekhaben", "Rekhaben", "Ajanaben", "Goriben", "Sumitraben", "Ashaben", "Kusumben", "Ramilaben", "Kuntaben", "Lataben", "Viruben"]
$(function(){
  $('a.youtube').fancybox({
      'transitionIn'	:	'elastic',
      'transitionOut'	:	'elastic',
      'speedIn'		:	300, 
      'speedOut'		:	100, 
      'overlayShow'	:	true
	});

  $('#shop-learn-involve > a').hover(function(){
    $('.' + this.id + '-div').fadeIn();
  }, function() {
    $('.' + this.id + '-div').hide();
  });
});
