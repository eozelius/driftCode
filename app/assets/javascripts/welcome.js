$(function(){
	/* Routes */
	$.ajax({
		url: '/get_routes',
		method: 'POST',
		dataType: 'JSON',
		complete: function(response) {
			var r = response.responseJSON;
			window.r = r

			// init Timeline
			DriftMapTimeline.init(r);

			// init Leaflet
			DriftMapLeaflet.init(r);

			// init Accordian
			DriftMapAccordian.init(r);
		}
	});
});