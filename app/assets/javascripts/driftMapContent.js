var DriftMapContent = function(){
  // Private Variables

  // Private Methods

  return {
    // public variables


    // public methods
    init: function(journeys){
      for(var x in journeys){
        var j = journeys[x].journey
        var wps = journeys[x].waypoints
        $('.content-container').append('<div class="master-journey-content hidden" data-journey="'+ j.id +'">')

        for(var y in wps){
          var w = wps[y]
          var wp_container =  '<div class="master-waypoint-content hidden" data-waypoint="'+ w.id +'">' +
                                '<h4 class="waypoint-title">'+ w.title +'</h4>' + 
                                '<div class="content-type master-galleries-container hidden">' +
                                  '<h6 class="content-title">Galleries</h6>' +
                                  //'<ul class="galleries-list"></ul>' +
                                '</div>' +
                                '<div class="content-type master-friends-container hidden ">' +
                                  '<h6 class="content-title">Friends</h6>' +
                                  //'<ul class="friends-list"></ul>' +
                                '</div>' +
                                '<div class="content-type master-treks-container hidden">' +
                                  '<h6 class="content-title">Treks</h6>' + 
                                  //'<ul class="treks-list"></ul>' +
                                '</div>' +
                                '<div class="content-type master-essays-container  ">' +
                                  '<h6 class="content-title">Essays</h6>' +
                                  //'<ul class="essays-list"></ul>' +
                                '</div>' +
                              '</div>';

          $('.master-journey-content[data-journey="'+ j.id +'"]').append(wp_container)

          // GALLERIES ////
          /*if(w.content.galleries.length > 0){
            foo += '<div class="content content-gallery-container">'

            for(var z in w.content.galleries){
              var g = w.content.galleries[z]
              foo += '<div class="gallery" data-gallery="'+ g.id +' data-y="'+ g.y + '" data-x="'+ g.x+ '">'
            }
            foo += '</div>' // close class="content-gallery-container"
          }*/

          // FRIENDS ////
          for(var a in w.content.friends){
            var f = w.content.friends[a]

            // add friend name, photo description              
            var foo = '<div class="content-item friend" data-friend="'+ f.id +'" data-y="'+ f.y + '" data-x="'+ f.x+ '">' + 
                        '<p class="content-name">'+ f.first_name + f.last_name +'</p>' +
                        '<img class="content-image" src="'+ f.photo.url +'">' + 
                        '<p class="content-description">'+ f.description +'</p>'
                      '</div>';
            $('.master-waypoint-content[data-waypoint="'+ w.id +'"] .master-friends-container').append(foo)
          }

          // ESSAYS ////
          for(var b in w.content.essays){
            var e = w.content.essays[b]

            var foo = '<div class="content-item essay" data-essay="'+ e.id +'" data-y="'+ e.y + '" data-x="'+ e.x+ '">' + 
                        '<p class="content-name">'+ e.title +'</p>' +
                        '<img class="content-image" src="'+ e.coverphoto.url +'">' + 
                        '<p class="content-description">'+ e.body +'</p>'
                      '</div>';
            $('.master-waypoint-content[data-waypoint="'+ w.id +'"] .master-essays-container').append(foo)
          }          
          
          if(w.content.essays.length    > 0){}
          if(w.content.treks.length     > 0){}

        }// end for(var y in wps)

        // hide all journeys, waypoints, galleries except the first
        $('.master-journey-content:first-child, .master-journey-content:first-child .master-waypoint-content:first-child').removeClass('hidden')
        $('.friends:first-child').removeClass('hidden')




      } // end for(var x in journeys)


      /* Event listeners */

    },

    focusWayPoint: function(id){
      if(id !== undefined){

      } else {

      }
    },

    focusJourney: function(id){
      if(id !== undefined){

      }
    }
  }
}();