$(function(){
  $('.fullname').watermark("Fullname");
  $('.emailtext').watermark("Email");
  $('.zipcode').watermark("Zipcode");
  $('.messagetext').watermark("Message");
  $('.address').watermark("Address");
  $('#partner_submit').on('click', function(event){
    $('#ajaxloader').show();
  });
});
