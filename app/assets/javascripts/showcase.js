$(function(){
  $('.photo img').each(function(){
    if (this.height == 144) {
      $(this).attr("height", "108");
    }
  });
  $('.photo img').fadeIn("slow");
  $('.photo').fancybox();
});
