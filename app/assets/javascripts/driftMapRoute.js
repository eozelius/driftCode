var DriftMapRoute = function(){
	// Private Variables

	/*
		ex: indexer[x]: 
		{ 
			id: 51,
			description: "My gonzo adventure into Colombia in…", 
			title: "2015 - Colombia", 
			post_id: 1, 
			created_at: "2016-12-03T20:05:51.694Z", 
			updated_at: "2016-12-03T20:05:51.694Z", 
			coverphoto: { url: "/uploads/route/coverphoto/51/7.JPG" }
		}
	*/

	var indexer = [];
	var currentRoute;
	var count = 0;

	// Private Methods


	return {
		// public variables

		// public methods
		init: function(routes){
			for(var i in routes){
				indexer.push(routes[i]);
			}
			currentRoute = indexer[routes.length-1];
		},

		getRoute: function(id){
			for(var i in indexer){
				if(indexer[i].id == id) { return indexer[i] }
			}
			return false;
		},

		focusRoute: function(id){
			
		}
	}	
}();