$(document).ready(function(){
  $('span.save-wizard').on('click', function(){
    var init_x = map.getCenter().lat.toFixed(4);
    var init_y = map.getCenter().lng.toFixed(4);
    var zoom   = map.getZoom();

    $('#post_init_x').val(init_x);
    $('#post_init_y').val(init_y);
    $('#post_init_zoom').val(zoom);
    $('#new_post').submit();
  });
});