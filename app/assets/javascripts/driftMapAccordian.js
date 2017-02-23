var DriftMapAccordian = function(){
	// Private Variables
	// var indexer = []

	// Private Methods

	return {
		// public variables


		// public methods
		init: function(journeys, user_is_home){
			for(var x in journeys){
				var r = journeys[x].journey
				var wps = journeys[x].waypoints

				var a = '<div data-journey="'+ r.id +'" class="panel panel-default">' + 
									'<div id="heading-'+ x +'" class="panel-heading" >' + 
										'<h4 class="panel-title">' +
											'<a class="journey-switcher" role="button" data-toggle="collapse" data-parent="#waypt-accord" href="#collapse-'+ r.id +'" aria-expanded="true" aria-controls="collapse-'+ x +'" data-journey="'+ r.id +'">' + 
												r.title +
											'</a>' + 
										'</h4>' + 
									'</div>' + 
									'<div id="collapse-'+ r.id +'" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading-'+ r.id +'">' +
										'<div class="panel-body">' +
											'<ul class="waypoints-container">';

				for(var y in wps){
					var w = wps[y]
					a += '<li data-slideindex="'+ y +'" class="waypoint" data-waypoint="'+ w.id +'" data-initx="'+ w.x +'" data-inity="'+ w.y +'" data-waypointslide="'+ y +'" data-journeyid="'+ r.id +'">' + 
	  							'<p class="waypoint-title">'+ w.title +'</p>' +
	  						'</li>';
				}

				a += '</ul></div></div></div>';
				$('#waypt-accord').append(a);
			} // end for(var x in journeys)

			// if user_is_home, add edit capability
			if(user_is_home){
				$('.panel').each(function(index){
					console.log("this: " + $(this) + ' index: ' + index)
					var j_id = $(this).data('journey')

					$(this).find('.journey-switcher').after('<a href="/journeys/' + j_id + '/edit" style="font-size: .85em; font-style: italic; color: #C2D9EB"> - edit </a>')

				});
			}

			$('.panel-default:first-child .panel-collapse').addClass('in')
			$('.waypoints-container').first().find('.waypoint-title').first().addClass('li-waypoint-selected')

			/* Event listeners */
			// Click a specific waypoint
			$('li.waypoint').on('click', function(){
				var slide_index = $(this).data('slideindex') + 1
				var id = $(this).data('waypoint')
				var wp = DriftMapLeaflet.getWayPoint(id);

				if(wp){
					var wp_journey_id = wp.journey_id
					DriftMapLeaflet.focusWayPoint(id);
					DriftMapAccordian.focusWayPoint(id);
					DriftMapTimeline.focusJourney(wp_journey_id, slide_index, false)
				}
			});

			// Click a specific journey
			$('.journey-switcher').on('click', function(){
				var r_id = $(this).data('journey');
				var r = DriftMapTimeline.getJourney(r_id);
				var first_wp_id = $('.panel-default[data-journey="'+ r_id +'"] li.waypoint').first().data('waypoint')

				if(r){
					/* Timeline */
					DriftMapTimeline.focusJourney(r_id, 0, true);

					/* Waypoints */
					$('.waypoint-title').removeClass('li-waypoint-selected')
					$('.waypoint[data-slideindex="0"] p').addClass('li-waypoint-selected')
				}

				/* Leaflet */
				if(first_wp_id !== undefined){ DriftMapLeaflet.focusWayPoint(first_wp_id) }
			});
		},

		focusWayPoint: function(id){
			if(id !== undefined){
				$('.li-waypoint-selected').removeClass('li-waypoint-selected');
				$('li.waypoint[data-waypoint="'+ id +'"] p').addClass('li-waypoint-selected');
			} else {
				$('.journey-content:visible .waypoints-container li p').first().addClass('li-waypoint-selected')
			}
		},

		focusJourney: function(id){
			if(id !== undefined){
				$('.panel[data-journey="'+ id +'"] .panel-collapse').addClass('in');
			}
		}
	}
}();