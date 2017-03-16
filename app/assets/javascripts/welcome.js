/* INDEX ACTION */
$(function(){
  $.ajax({
    url: '/api_home',
    method: 'POST',
    dataType: 'JSON',
    complete: function(response) {
      var r = response.responseJSON;

      console.log(JSON.stringify(r))


      window.r = r

      // init Timeline
      // DriftMapTimeline.init(r);

      // init Leaflet
      DriftMapLeaflet.init(r);

      // init Accordian
      DriftMapAccordian.init(r);
    }
  })
})