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
    var popupOptions = {
      className: 'new-blip-box',
      offset: [500, 0]
    }
    var postId = $('#post_user_id').val();

    var postForm ='<div class="blip-wrapper">' +
                    '<p class="instructions">Title</p>' +
                    '<input id="blip-title" name="blip[title]" type="text" />' +
                    '<p class="instructions">Description</p>' +
                    '<textarea id="blip-body" name="blip[body]"></textarea>' +
                    '<span class="normal">cancel</span>' +
                  '</div>';

    L.marker([lat, lng]).addTo(window.map);
    L.popup(popupOptions).setLatLng([lat, lng]).setContent(postForm);

    // Update Post Form
    var hiddenInputs = '<input type="hidden" name="blip[x]" value="'+ lat +'">' + 
                       '<input type="hidden" name="blip[y]" value="'+ lng +'">'; 
    $('.edit_post').append(hiddenInputs);
  });

  // Submit form
  $('span.save-wizard').on('click', function(){
    var init_x = window.map.getCenter().lat;
    var init_y = window.map.getCenter().lng;
    var zoom   = window.map.getZoom();
 
    // Post attrs
    $('#post_init_x').val(init_x);
    $('#post_init_y').val(init_y);
    $('#post_init_zoom').val(zoom);

    // Blib attrs
    var blipTitle = '<input type="hidden" name="blip[title]" value="'+ $('#blip-title').val() +'">';
    var blipBody  = '<input type="hidden" name="blip[body]"  value="'+ $('#blip-body').val()  +'">';

    $('#post-form-container form').append(blipTitle, blipBody).submit();
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