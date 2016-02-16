var DriftMap = function(){
  // Private Attributes

  // DriftMap event Listeners
  $(document).ready(function(){
    /* Wizard */
    /* wizard - steps */
    $('li.wizard-step').on('click',function(){
      var action = $(this).attr('data-action');
      var open;
      $(this).hasClass('step-open') ? open = true : open = false;

      if(open){
        $(this).removeClass('step-open');
        $('.action-'+action).fadeOut();
      } else {
        $('.step-open').removeClass('step-open');
        $('.details-open').fadeOut(1).removeClass('details-open');
        $(this).addClass('step-open');
        $('.action-'+action).slideDown().addClass('details-open');
        $('.action-'+action + ' input, textarea').focus();
      }
    });

    // wizard - save
    $('.save-wizard').on('click', function(){
      var driftMapForm = {
        title: $('#driftmap-title').val(),
        body: $('#driftmap-body').val(),
        layer: {
          initPt: window.map.getCenter(),
          initZoom: window.map.getZoom()
        },
        markers: undefined,
        route: undefined
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

  // private variables

  // public methods
  return {
    createDriftmap: function(driftMap, dom){
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