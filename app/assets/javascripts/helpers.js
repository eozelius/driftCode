// event listeners
/*$(document.ready(function(){

});*/

function initMap(x, y, zoom, geoLoc) {
	var map = L.map('map').setView([x, y], zoom);

	// TODO make this API key a Server environment variable
	L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token={accessToken}', 
		{
    	attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, <a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="http://mapbox.com">Mapbox</a>',
    	maxZoom: 18,
    	id: 'eozelius77.j4hekake',
    	accessToken: 'pk.eyJ1IjoiZW96ZWxpdXM3NyIsImEiOiJkQmhDSl8wIn0.MzOmrtAL3uTNmVfLmEZ57g'
		}).addTo(map);

	if(geoLoc)
		var currentPos = L.marker([x, y]).addTo(map);
}
