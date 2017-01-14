$(function(){
	/* Routes */
	$.ajax({
		url: '/get_journeys',
		method: 'POST',
		dataType: 'JSON',
		data: {	index: 'index' },
		complete: function(response) {
			var r = response.responseJSON;
		}
	});

	/* WayPoints */
	$.ajax({
		url: '/get_way_pts',
		method: 'POST',
		dataType: 'JSON',
		data: {	index: 'index' },
		complete: function(response) {
			var r = response.responseJSON;
		}
	});

	/* Timeline */



	/* Leaflet */



});