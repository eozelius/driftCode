var DriftMapAccordian = function(){
	// Private Variables
	var indexer = []

	// Private Methods

	return {
		// public variables


		// public methods
		init: function(routes){
			for(var x in routes){
				var r = routes[x].route
				var wps = routes[x].waypoints

				var a = '<div class="panel panel-default">' + 
									'<div id="heading-'+ x +'" class="panel-heading" >' + 
										'<h4 class="panel-title">' +
											'<a role="button" data-toggle="collapse" data-parent="#waypt-accord" href="#collapse-'+ r.id +'" aria-expanded="true" aria-controls="collapse-'+ x +'" data-route="'+ r.id +'" class="route-switcher" >' + 
												r.title +
											'</a>' + 
										'</h4>' + 
									'</div>' + 
									'<div id="collapse-'+ r.id +'" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading-'+ r.id +'">' +
										'<div class="panel-body">' +
											'<ul class="waypoints-container">';

				for(var y in wps){
					var w = wps[y]
					a += '<li class="blip" data-blip="'+ w.id +'" data-initx="'+ w.x +'" data-inity="'+ w.y +'" data-blipslide="'+ y +'" data-routeid="'+ r.id +'">' + 
	  							'<p class="blip-title">'+ w.title +'</p>' +
	  						'</li>';
				}

				a += '</ul></div></div></div>';
				$('#waypt-accord').append(a);
			}
			$('.panel-default:first-child .panel-collapse').addClass('in');
			$('.waypoints-container').first().find('.blip-title').first().addClass('li-blip-selected')
		}
	}
}();

// <%= 'in' if index == 0 %>
// <%= 'li-blip-selected' if index == 0 %>