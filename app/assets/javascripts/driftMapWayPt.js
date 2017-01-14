var DriftMapWayPt = function(){
	// Private Variables

	/*
		ex indexer[x] = 
		{ 
			id: 12, 
			title: 
			"Burmuda", 
			body: "Burmuda might be the best place in …", 
			x: 32.3286273, 
			y: -64.7264328, 
			post_id: 1, 
			route_id: null, 
			created_at: "2016-10-27T10:34:10.417Z", 
			updated_at: "2016-11-23T17:09:20.237Z", 
			date: "2016-01-29T00:00:00.000Z" 
		}
	*/
	var indexer = []
	var currentWayPoint;

	// Private Methods
	function focusWayPt(){

	}

	return {
		// public variables


		// public methods
		init: function(waypoints){
			for(var i in waypoints){
				indexer.push(waypoints[i]);
			}
			currentWayPoint = indexer[waypoints.length-1]
		},

		/* Getters */
		getWayPt: function(id){

		},

		getCurrentWayPt: function(){

		},

		getCorrespondingRoute: function(id){

		},

		getCorrespondingMarker: function(id){

		},

		getCorrespondingTimeline: function(id){

		},

		/* Setters */
		setWayPt: function(id){

		}
	}
}();