$(function(){
  // NEW ////
  if($('#driftmaps_new').length){

  }
  
  // EDIT ////
  if($('#driftmaps_edit').length){
    // DriftMapLeaflet.defaultInit();

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

    // Click a theme title ex: dark/blue
    $('.color-schemes p').on('click', function(){
      var color = $(this).text()

      if(color == 'blue'){ 
        $('#driftmap_color_scheme_default').click()
        return
      } else {
        $('#driftmap_color_scheme_' + color).click()
      }
    })
  }
})