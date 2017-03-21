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
      
      DriftMapLeaflet.init(r)

      // init Accordian
      DriftMapAccordian.init(r)

      // init Content
      DriftMapContent.init(r)
    }
  })
})