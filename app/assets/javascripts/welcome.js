$(function(){
	/* Routes */
	$.ajax({
		url: '/get_routes',
		method: 'POST',
		dataType: 'JSON',
		complete: function(response) {
			var r = response.responseJSON;

			// Init Routes & waypoints
			DriftMapRoute.init(r);

			// init Timeline
			DriftMapTimeline.init(r);

			// init Leaflet
			DriftMapLeaflet.init(r);
		}
	});

	/* WayPoints */
	/*$.ajax({
		url: '/get_way_pts',
		method: 'POST',
		dataType: 'JSON',
		complete: function(response) {
			var wp = response.responseJSON;
			// Index Waypoints
			DriftMapWayPt.init(wp);

			// Init Leaflet
			DriftMapLeaflet.init(wp);
		}
	});*/

	/* Timeline */




	/* Leaflet */



});