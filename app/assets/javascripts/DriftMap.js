var DriftMap = function(){
  // Private Attributes
  var driftMapForm = {
    title: undefined,
    body: undefined,
    layer: {
      initPt: [0,0],
      initZoom: 12
    },
    markers: undefined,
    route: undefined
  }
  var createStep = 1;

  // DriftMap event Listeners
  /* Edit/New Form */
  $(document).ready(function(){
    $('.create-next-step').on('click',function(){
      var prev = createStep;
      var next = createStep + 1;
      $('.create-step-'+prev).fadeOut();
      $('.create-step-'+next).slideDown().removeClass('hidden');
        
      switch(prev) {
        case 1:
          driftMapForm.title = $('#driftmap-title').val();
          $('h3.page-title').text('give your driftMap a description')
          break;

        case 2:
          driftMapForm.body = $('#driftmap-body').val();
          $('h3.page-title').text('driftMap starting location')
          break;

        case 3:
          $('.create-next-step').addClass('hidden');
          driftMapForm.layer.initPt   = map.getCenter();
          driftMapForm.layer.initZoom = map.getZoom(); 
          $('#driftmap-json').val(JSON.stringify(driftMapForm))

          $('#new_user input[type="text"]').each(function(){
            $(this).val(xss_trim($(this).val()));
          });
          $('#new_user').submit();

        default:
          console.log("Something went wrong. form: " + JSON.stringify(driftMapForm));
          break;
      }

      createStep++;
    });
  });

  // private variables

  // public methods
  return {
    initDriftMap: function(driftMap, dom){
      var init_x = 40.735;
      var init_y = -73.890;
      var zoom   = 13;

      // todo better error checking
      if(driftMap !== null){
        init_x = driftMap.layer.initPt.lat.toFixed(3);
        init_y = driftMap.layer.initPt.lng.toFixed(3);
        zoom   = driftMap.layer.initZoom;
      }

      window.map = L.map(dom).setView([init_x, init_y], zoom);
      L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token={accessToken}', {
        attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, <a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="http://mapbox.com">Mapbox</a>',
        maxZoom: 22,
        id: 'eozelius77.j4hekake',
        accessToken: 'pk.eyJ1IjoiZW96ZWxpdXM3NyIsImEiOiJkQmhDSl8wIn0.MzOmrtAL3uTNmVfLmEZ57g'
      }).addTo(window.map);
      L.marker([init_x, init_y]).addTo(window.map);
    },

    init_markers: function(driftMap, markers, dom){
      if(typeof driftMap.markers === 'undefined' ){
        console.log("this dude aint got no fucking routes.")
      } else {
        console.log("this brother got routes")
      }
    }
  }
}();