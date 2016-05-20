$(document).ready(function(){
  // Initialize Driftmap TODO move this into a map initialization function
  try {
    var init_x = 40.735;
    var init_y = -73.890;
    var zoom   = 13;
    var map;

    if(navigator.geolocation){
      navigator.geolocation.getCurrentPosition(function(pos){
        x = pos.coords.latitude.toFixed(3);
        y = pos.coords.longitude.toFixed(3);
        map = L.map('post-map').setView([x, y], 12);
        // TODO make this API key a Server environment variable
        L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token={accessToken}', 
          {
            attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, <a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="http://mapbox.com">Mapbox</a>',
            maxZoom: 18,
            id: 'eozelius77.j4hekake',
            accessToken: 'pk.eyJ1IjoiZW96ZWxpdXM3NyIsImEiOiJkQmhDSl8wIn0.MzOmrtAL3uTNmVfLmEZ57g'
          }).addTo(map);
      });
    } else {
      map = initMap(x, y, 12, false);
    }
  } catch(e){
    var msg = e.message;
    console.log('error: ' + msg);
    flash_now('danger', 'Whoops, something went wrong.  Please try again.');
  }

  // Click next step
  $('.next-step').on('click', function(){
    var next = $('.active-step').data('next');
    $('.active-step').slideUp().removeClass('active-step');
    $('.wizard-' + next).addClass('active-step').slideDown();

    if(next == 'init'){
      $('.next-step').slideUp();
      $('.save-wizard').removeClass('hidden').slideDown();
    }
  });

  // Submit form
  $('span.save-wizard').on('click', function(){
    var init_x = map.getCenter().lat.toFixed(4);
    var init_y = map.getCenter().lng.toFixed(4);
    var zoom   = map.getZoom();

    $('#post_init_x').val(init_x);
    $('#post_init_y').val(init_y);
    $('#post_init_zoom').val(zoom);
    $('#new_post').submit();
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