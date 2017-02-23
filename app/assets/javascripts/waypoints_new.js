$(function(){
	/*
	[{
		journey: { 
			id: 51, 
			description: "My gonzo adventure into Colombia in…", 
			title: "2015 - Colombia", 
			driftmap_id: 1, 
			created_at: "2016-12-03T20:05:51.694Z", 
			updated_at: "2016-12-03T20:05:51.694Z", 
			coverphoto: {	url: 'assets/asfd.png' },
			timeline: < timelineJS3 data >
		},
		
		waypoints: [{ 
			id: 10, 
			title: "Sunnyside Queens", 
			body: "Queens NY.  From Flushing to Astori…", 
			x: 40.743, 
			y: -73.922, 
			driftmap_id: 1, 
			journey_id: 51, 
			date:  { year: 2016, month: 11, day: 23 } 
		}, {}, ...]
	}, ...]
	*/

	// Leaflet
	var data = [{
		journey: {
			id: $('#journey_id').val(),
			description: '',
			description: '',
			coverphoto: '',
		},

		waypoints: [{

		}]
	}


	// init date-picker-calender
	$('#datetimepicker1').datetimepicker();

	var photo_index = 0;
	var locationSet = false;
	
	// add photos to blip
	$(document).on('click', '.add-photo', function(){
		$(this).data('photo-index', ++photo_index)
		var index = $(this).data('photo-index')
		var new_img = '<input class="blip-image" name="photo['+ index +']" accept="image/jpeg, image/gif, image/png, image/jpg" type="file" data-image="'+ index +'" style="margin: 6% 6% 5% 3%; width:100%;">';
		$('.add-photo').last().after(new_img);
	});

	// set location of blip
	window.map.on('click', function(e){
		window.map.off('click');
		locationSet = true;
		setLatLng(e.latlng.lat, e.latlng.lng);

		var m = L.marker([e.latlng.lat, e.latlng.lng]).addTo(window.map)
		m.dragging.enable();
		m.on('dragend', function(e){
			setLatLng(e.target.getLatLng().lat, e.target.getLatLng().lng)
		});
	});

	// submit form
	$('.commit').on('click', function(){
		if(locationSet == false) {
			alert('A location must be set, click anywhere on the map to set your blip.');
			return false;
		} else {
			var date = $('#blip_date').val();
			var mm = 	 date.slice(0, 2)
			var dd = 	 date.slice(3, 5)
			var yyyy = date.slice(6, 10);
			$('#blip_date').val(yyyy + mm + dd);
			$('form').submit();
		}
	});

	function setLatLng(lat, lng) {
		$('#blip_x').val(lat);
		$('#blip_y').val(lng);			
	}
});