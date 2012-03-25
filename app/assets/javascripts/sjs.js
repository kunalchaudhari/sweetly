$(function(){
  $('.lastname').watermark("Lastname");
  $('.firstname').watermark("Firstname");
  $('.emailtext').watermark("Email");
  $('.company').watermark("Company or Organization");
  $('.street1').watermark("Street1");
  $('.street2').watermark("Street2");
  $('.citytext').watermark("City");
  $('.state').watermark("State");
  $('.zipcode').watermark("Zipcode");
  $('#partner_submit').on('click', function(event){
    $('#ajaxloader').show();
    $(this).text("Accepting your request...");
  });
});