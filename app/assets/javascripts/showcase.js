$(function(){
  $('.photo img').each(function(){
    if (this.height == 144) {
      $(this).attr("height", "108");
    }
  });
  $('.big_loader').hide();
  $('.showcase_promo').fadeIn("slow");
  $('.photo img').fadeIn("slow");
  $('.photo').fancybox();
  $('#getintouch_showcase').click(function(){
    $('#partner_showcase').toggle("slow");
  });
});
