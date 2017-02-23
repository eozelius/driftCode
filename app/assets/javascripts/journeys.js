$(function(){

	/* NEW ACTION */


	/* CREATE ACTION */

	/* EDIT ACTION */
	if($('#journeys_edit').length){
		$.ajax({
			url: '/api_journey_edit',
			method: 'POST',
			dataType: 'JSON',
			data: { id: $('#journey_id').val() },
			complete: function(response){
				var r = response.responseJSON
				window.edit_r = r

				DriftMapTimeline.init(r)
				DriftMapLeaflet.init(r)
				DriftMapAccordian.init(r)

				var foobar = true
				setTimeout(function(){
					if(foobar){
						foobar = false	
						$('.journey-content').removeClass('hidden')
					}
				}, 500);
			}
		})
	}


	/* UPDATE ACTION */
});

if(false){



$(document).ready(function(){
	var photo_index = 0;
	var locationSet = false;

	/* Add a stop */
	$(".add-route-stop").on('click', function(){
		/* Switch from Route Details to Blip details */
		$('.journey-info, .first-stop-info').toggleClass('hidden');
		$('form').append('<input type="hidden" name="new_blip" value="true">');

		/* Remove all markers/popups from the map */
		$('.leaflet-marker-pane img, .leaflet-shadow-pane img').remove();
		$('.leaflet-popup-pane div').addClass('hidden');
	});

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
		var date = $('#blip-date').val();
		var mm = 	 date.slice(0, 2)
		var dd = 	 date.slice(3, 5)
		var yyyy = date.slice(6, 10);
		$('#blip_date').val(yyyy + mm + dd);

		if( locationSet == false && $('input[name="new_blip"]').length ){
			alert('A location must be set, click anywhere on the map to set your blip.')
		} else {
			$('form').submit();
		}
	});

	function setLatLng(lat, lng) {
		$('#blip_x').val(lat);
		$('#blip_y').val(lng);			
	}
});

}