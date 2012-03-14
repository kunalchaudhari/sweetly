$(function(){
  $('.subscription input.text').watermark("Enter your email");
  $('#subscribe').on('click', function(){
    $(this).text('Subscribing...');
  })
});