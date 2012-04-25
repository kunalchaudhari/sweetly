$(function(){
  $('.fullname').watermark("Fullname");
  $('.emailtext').watermark("Email");
  $('.country').watermark("Country");
  $('.messagetext').watermark("Message");
  $('.address').watermark("Address");
  $('#partner_submit').on('click', function(event){
    $('#ajaxloader').show();
  });
});
