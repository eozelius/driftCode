$(function(){
	/* Routes */
	/*$.ajax({
		url: '/get_journeys',
		method: 'POST',
		dataType: 'JSON',
		data: {	index: 'index' },
		complete: function(response) {
			alert('done;  check window.r');
			window.r = response;
		}
	});*/


	/* WayPoints */
	$.ajax({
		url: '/get_way_pts',
		method: 'POST',
		dataType: 'JSON',
		data: {	index: 'index' },
		complete: function(response) {
			window.r = response;
		}
	});




	/* Timeline */



	/* Leaflet */



});