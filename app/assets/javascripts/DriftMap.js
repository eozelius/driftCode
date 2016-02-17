var DriftMap = function(){
  // Private Attributes
  var route = [];

  // DriftMap event Listeners
  $(document).ready(function(){
    /* Wizard */
    /* wizard - steps */
    $('li.wizard-step').on('click',function(){
      var action = $(this).attr('data-action');
      $('li').removeClass('open');
      $(this).addClass('open');
      $('.open-action').removeClass('open-action');
      $('div[data-action="'+action+'"]').addClass('open-action');
    });

    /* Wizard - create routes */
    $('.create-route').on('click', function(){
      $('.action-routes p.instructions-title').text('click anywhere on the map to start a route')
      // Add event listeners for create routes
      map.on('click', function(e){
        var x = parseFloat(e.latlng.lat.toFixed(4));
        var y = parseFloat(e.latlng.lng.toFixed(4));
        route.push([x, y]);
        var polyline = L.polyline(route).addTo(map);

        // create new marker icon
        // var m = L.marker(pt).addTo(map);

        // create line between 2 pts
        if(route.length > 1) {
          var myLines = [{
              "type": "LineString",
              "coordinates": route
          }];
          
          var geoRoute = L.geoJson(myLines).addTo(map);
        }

      });
    });
 
    // wizard - save
    $('.save-wizard').on('click', function(){
      var driftMapForm = {
        title: $('#driftmap-title').val(),
        body: $('#driftmap-body').val(),
        layer: {
          initPt: map.getCenter(),
          initZoom: map.getZoom()
        },
        markers: undefined,
        route: route
      };

      $.ajax({
        url: '/driftmap',
        type: 'post',
        dataType: 'json',
        timeout: 4000,
        data: {
          driftmap: JSON.stringify(driftMapForm)
        },

        beforeSend: function(){
          // DriftMap.valid_form(driftMapForm)
        },
        complete: function(r){
          if(r.responseJSON.status == 'success')
            window.location.href = r.responseJSON.redirect_url
        }
      });
    });   
  });

  // public methods
  return {
    createDriftmap: function(driftMap, dom){
      window.driftMap = driftMap
      var init_x = 40.735;
      var init_y = -73.890;
      var zoom   = 13;

      // todo better error checking
      if(driftMap !== null){
        init_x = driftMap.layer.initPt.lat.toFixed(3);
        init_y = driftMap.layer.initPt.lng.toFixed(3);
        zoom   = driftMap.layer.initZoom;
        routes = driftMap.route
      }

      var map = L.map(dom).setView([init_x, init_y], zoom);
      L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token={accessToken}', {
        attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, <a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="http://mapbox.com">Mapbox</a>',
        maxZoom: 22,
        id: 'eozelius77.j4hekake',
        accessToken: 'pk.eyJ1IjoiZW96ZWxpdXM3NyIsImEiOiJkQmhDSl8wIn0.MzOmrtAL3uTNmVfLmEZ57g'
      }).addTo(map);

      // Add routes
      var geoRoutes = L.polyline(routes).addTo(map);
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