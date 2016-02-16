$(document).ready(function(){
  
  $('.signup').on('click', function(){
    $('#new_user input[type="text"]').each(function(){
      $(this).val(xss_trim($(this).val()));
    });

    $('#new_user').submit();
  });
});