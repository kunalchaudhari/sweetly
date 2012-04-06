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
  // $('#designer-profiles').cycle({ 
  //       fx:     'fade', 
  //       speed:  'fast', 
  //       timeout: 5000, 
  //       pager:  '.designer-rack', 
  //       updateActivePagerLink: function(pager, idx, activeClass){
  //         $('.' + activeClass).removeClass(activeClass).stop().animate({  
  //             top:'0',
  //             left:'0',
  //             width:'90px',
  //             height:'90px'}, 400);;
  //         
  //         $(this.pagerAnchors[idx][0].childNodes[0]).addClass(activeClass).stop().animate({  
  //             top:'-5',
  //             left:'-5',
  //             width:'110',
  //             height:'110'}, 400);
  //         
  //         $('#see-designs').text("See Designs from " + designers[idx]);
  //       },
  //       // callback fn that creates a thumbnail to use as pager anchor 
  //       pagerAnchorBuilder: function(idx, slide) { 
  //           var cls = (((idx+1)%4 == 0) ? 'class = "last"': "");
  //           return '<a href="#"><img src="/assets/designer/' + (idx+1) + '.jpg" /></a>'; 
  //       } 
  //   });

});
