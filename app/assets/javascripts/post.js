$(document).ready(function(){
  // Click next step
  $('.tabs-menu li').on('click', function(){
    $('.active-tab').removeClass('active-tab');
    var tab = $(this).data('step');
    $(this).addClass('active-tab');

    $('.wizard-step').addClass('hidden');
    $('.wizard-'+tab).removeClass('hidden');    
  });

  // Submit form
  $('span.save-wizard').on('click', function(){
    var init_x = window.m.getCenter().lat;
    var init_y = window.m.getCenter().lng;
    var zoom   = window.m.getZoom();

    console.log("clicked\n" + 'x: ' + init_x + '\ny: ' + init_y + '\nz: ' + zoom);

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