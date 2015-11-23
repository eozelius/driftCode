$(document).ready(function(){
	// edit post
	$('a.edit-anchor').on('click', function(){
		$('.alter-post-container').slideDown();
	});

	// cancel edit post
	$('.cancel-edit-post').on('click', function(){
		$('.alter-post-container').slideUp();
	});

	// edit profile info
	$('.edit-user-anchor').on('click', function(){
		$('.alter-user-container').slideDown();
		$('.profile-details-container').addClass('form-open');
	});

	// cancel edit user
	$('.cancel-edit-user').on('click', function(){
		$('.alter-user-container').slideUp();
		$('.profile-details-container').removeClass('form-open');
	});
});