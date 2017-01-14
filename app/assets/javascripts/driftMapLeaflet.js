L.Icon.Default.imagePath = '<%= (Rails.root + "/assets/leaflet").to_s %>';

var DriftMapLeaflet = function(){
	// Private Variables
	var currentMarker;
	
	/*
		indexer ex: {
			id: <corresponding wayPoint id>
			<LeafletJS data>
		}
	*/
	var indexer = []

	/* Custom Makers */
	var maroonMarker = L.icon({ 
	  iconUrl: '<%= (Rails.root + "/assets/leaflet/marker-maroon-icon.png").to_s %>',
	  shadowUrl: '<%= (Rails.root + "/assets/leaflet/marker-shadow.png").to_s %>',
	  popupAnchor:  [0, -35]
	});

	var blueMarker = L.icon({
	  iconUrl: '<%= (Rails.root + "/assets/leaflet/marker-icon.png").to_s %>',
	  shadowUrl: '<%= (Rails.root + "/assets/leaflet/marker-shadow.png").to_s %>',
	  popupAnchor:  [0, -35]
	});

	// Private Methods
	function focusWayPoint(){
		return true;
	}

	/* Event Listeners */

	return {
		// public variables


		// public methods
		init: function(dom, mapData, wayPoints){

		},

		/* Getters */
		getMarker: function(id){

		},

		/* Setters */
		setMarker: function(id){

		}
	}
}