var DriftMapTimeline = function(){
	// Private Variables

	/*
		ex indexer[x] = {
			id: "<Corresponding Route ID>",
			< TimelineJS3 data... >
		}
	*/
	var indexer = [];
	var currentTimline;
	var currentSlide;

	// Private Methods
	function focusTimeline(tl, slide){

	}

	function renderTimeline(dom, tlData, opts){

	}

	return {
		// public variables

		// public methods
		init: function(routes){
			window.r = routes;
			for(var i in routes){
				var coverphoto = typeof routes[i].coverphoto.url !== 'undefined' ? routes[i].coverphoto.url : '<%= image_path("switzerland10.JPG").html_safe %>';





			}
		},

		getTimeline: function(id){

		},

		getCurrentTimeline: function(){

		},

		getCurrentSlide: function(){

		},

		getCorrespondingRoute: function(id){

		},

		/* Setters */
		setTimeline: function(id, slide){

		}
	}	
}();