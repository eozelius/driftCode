$(function(){
  // NEW ////
  if($('#driftmaps_new').length){

  }
  
  // EDIT ////
  if($('#driftmaps_edit').length){
    DriftMapLeaflet.defaultInit();

    // submit form
    $('span.normal.save').on('click', function(){
      var lat = window.map.getCenter().lat
      var lng = window.map.getCenter().lng
      var zoom = window.map.getZoom()

      $('#driftmap_init_x').val(lat)
      $('#driftmap_init_y').val(lng)
      $('#driftmap_init_zoom').val(zoom)
      $('form').submit();
    });
  }
})