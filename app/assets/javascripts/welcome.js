/* INDEX ACTION */
$(function(){
  $.ajax({
    url: '/api_home',
    method: 'POST',
    dataType: 'JSON',
    complete: function(response) {
      var r = response.responseJSON;
      window.r = r

      // init Timeline
      // DriftMapTimeline.init(r)

      // init Leaflet
      var opts = {
        init_x: r[0].waypoints[0].x,
        init_y: r[0].waypoints[0].y + 40,
        init_zoom: 6,
        color_scheme: 'dark'
      }

      DriftMapLeaflet.init(r, opts)

      // init Accordian
      DriftMapAccordian.init(r)

      // init Content
      DriftMapContent.init(r)
    }
  })
})