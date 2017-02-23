$(function(){
	DriftMapLeaflet.defaultInit()

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
	window.leafletIndexer[0].leaflet.map.on('click', function(e){
		window.leafletIndexer[0].leaflet.map.off('click');
		locationSet = true;
		setLatLng(e.latlng.lat, e.latlng.lng);

		var marker = L.marker([e.latlng.lat, e.latlng.lng]).addTo(window.leafletIndexer[0].leaflet.map)
		marker.dragging.enable();
		marker.on('dragend', function(e){
			setLatLng(e.target.getLatLng().lat, e.target.getLatLng().lng)
		});
	});

	// submit form
	$('.commit').on('click', function(){
		if(locationSet == false) {
			alert('A location must be set, click anywhere on the map to set your blip.');
			return false;
		} else {
			var date = $('#datepicker-input').val();
			var mm = 	 date.slice(0, 2)
			var dd = 	 date.slice(3, 5)
			var yyyy = date.slice(6, 10);
			$('#waypoint_date').val(yyyy + mm + dd);
			$('form').submit();
		}
	});

	function setLatLng(lat, lng) {
		$('#blip_x').val(lat);
		$('#blip_y').val(lng);			
	}
});