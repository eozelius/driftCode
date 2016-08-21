$(document).ready(function(){
  // Click next step
  $('.tabs-menu li').on('click', function(){
    $('.active-tab').removeClass('active-tab');
    var tab = $(this).data('step');
    $(this).addClass('active-tab');

    $('.wizard-step').addClass('hidden');
    $('.wizard-'+tab).removeClass('hidden');    
  });

  // Markers
  window.map.on('click', function(e){
    var lat = e.latlng.lat.toFixed(3);
    var lng = e.latlng.lng.toFixed(3);

    L.marker([lat, lng]).addTo(window.map);

    var options = {
      className: 'marker-box',
      offset: [500, 0]
    }

    var popup = L.popup(options).setLatLng([lat, lng]).setContent('<p>Hello world!<br />This is a nice popup.</p>').openOn(window.map);

  });

  // Submit form
  $('span.save-wizard').on('click', function(){
    var init_x = window.map.getCenter().lat;
    var init_y = window.map.getCenter().lng;
    var zoom   = window.map.getZoom();

    $('#post_init_x').val(init_x);
    $('#post_init_y').val(init_y);
    $('#post_init_zoom').val(zoom);
    $('#post-form-container form').submit();
  });

  // Cannot upload images larger than 3M
  $('#post_picture').on('change', function() {
    var size_in_megabytes = this.files[0].size/1024/1024;
    if (size_in_megabytes > 3){
      alert('Maximum file size is 3MB. Please choose a smaller file.');
      return false;
    }
  });
});