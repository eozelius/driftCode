$(document).ready(function(){
	// edit post
	$('a.edit-anchor').on('click', function(){
		$('.alter-post-container').slideDown();
	});

	// cancel edit post
	$('.cancel-edit-post').on('click', function(){
		$('.alter-post-container').slideUp();
	})
});