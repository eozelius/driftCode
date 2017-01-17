$(function(){
	/* Routes */
	$.ajax({
		url: '/get_routes',
		method: 'POST',
		dataType: 'JSON',
		data: {	index: 'index' },
		complete: function(response) {
			var r = response.responseJSON;
			DriftMapRoute.init(r);
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
			DriftMapWayPt.init(r)

			// Init Leaflet
			DriftMapLeaflet.init(r);
		}
	});

	/* Timeline */




	/* Leaflet */



});