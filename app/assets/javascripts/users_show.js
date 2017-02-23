$(function(){
	$.ajax({
		url: '/api_profile_page',
		method: 'POST',
		dataType: 'JSON',
		data: { 
			id: $('#user_id').val()
		},
		complete: function(response){
			var r = response.responseJSON
			var home = $('#user_is_home').length ? true : false
			window.r = r

			// init Timeline
			DriftMapTimeline.init(r);

			// init Leaflet
			DriftMapLeaflet.init(r);

			// init Accordian
			DriftMapAccordian.init(r, home);
		}
	});
	// End initial AJAX call

	// DOM event listeners

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
	// End DOM event listeners
})