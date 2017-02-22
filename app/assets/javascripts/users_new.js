$(function(){
	// Cannot upload images larger than 3M
	$('.signup').on('click', function(){
	  $('#new_user input[type="text"]').each(function(){
	    $(this).val(xss_trim($(this).val()));
	  });

	  $('#new_user').submit();
	});

	$('#user_profile_pic').on('change', function() {
	  var size_in_megabytes = this.files[0].size/1024/1024;
	  if (size_in_megabytes > 3){
	    alert('Maximum file size is 3MB. Please choose a smaller file.');
	    return false;
	  }
	});
})