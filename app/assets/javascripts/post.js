$(document).ready(function(){
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