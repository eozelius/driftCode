var DriftMapAccordian = function(){
	// Private Variables
	// var indexer = []

	// Private Methods

	return {
		// public variables


		// public methods
		init: function(journeys){
			for(var x in journeys){
				var r = journeys[x].journey
				var wps = journeys[x].waypoints

				var a = '<div data-route="'+ r.id +'" class="panel panel-default">' + 
									'<div id="heading-'+ x +'" class="panel-heading" >' + 
										'<h4 class="panel-title">' +
											'<a class="route-switcher" role="button" data-toggle="collapse" data-parent="#waypt-accord" href="#collapse-'+ r.id +'" aria-expanded="true" aria-controls="collapse-'+ x +'" data-route="'+ r.id +'">' + 
												r.title +
											'</a>' + 
										'</h4>' + 
									'</div>' + 
									'<div id="collapse-'+ r.id +'" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading-'+ r.id +'">' +
										'<div class="panel-body">' +
											'<ul class="waypoints-container">';

				for(var y in wps){
					var w = wps[y]
					a += '<li data-slideindex="'+ y +'" class="waypoint" data-blip="'+ w.id +'" data-initx="'+ w.x +'" data-inity="'+ w.y +'" data-blipslide="'+ y +'" data-routeid="'+ r.id +'">' + 
	  							'<p class="blip-title">'+ w.title +'</p>' +
	  						'</li>';
				}

				a += '</ul></div></div></div>';
				$('#waypt-accord').append(a);
			} // end for(var x in routes)

			$('.panel-default:first-child .panel-collapse').addClass('in');
			$('.waypoints-container').first().find('.blip-title').first().addClass('li-blip-selected')

			/* Event listeners */
			// Click a specific waypoint
			$('li.waypoint').on('click', function(){
				var slide_index = $(this).data('slideindex') + 1
				var id = $(this).data('blip')
				var wp = DriftMapLeaflet.getWayPoint(id);

				if(wp){
					var wp_journey_id = wp.journey_id
					DriftMapLeaflet.focusWayPoint(id);
					DriftMapAccordian.focusWayPoint(id);
					DriftMapTimeline.focusRoute(wp_journey_id, slide_index, false)
				}
			});

			// Click a specific route
			$('.route-switcher').on('click', function(){
				var r_id = $(this).data('route');
				var r = DriftMapTimeline.getRoute(r_id);
				var first_wp_id = $('.panel-default[data-route="'+ r_id +'"] li.waypoint').first().data('blip')

				if(r){
					/* Timeline */
					DriftMapTimeline.focusRoute(r_id, 0, true);

					/* Waypoints */
					$('.blip-title').removeClass('li-blip-selected')
					$('.waypoint[data-slideindex="0"] p').addClass('li-blip-selected')
				}

				/* Leaflet */
				if(first_wp_id !== undefined){ DriftMapLeaflet.focusWayPoint(first_wp_id) }
			});
		},

		focusWayPoint: function(id){
			if(id !== undefined){
				$('.li-blip-selected').removeClass('li-blip-selected');
				$('li.waypoint[data-blip="'+ id +'"] p').addClass('li-blip-selected');
			} else {
				$('.route-content:visible .waypoints-container li p').first().addClass('li-blip-selected')
			}
		},

		focusRoute: function(id){
			if(id !== undefined){
				$('.panel[data-route="'+ id +'"] .panel-collapse').addClass('in');
			}
		}
	}
}();