function init_driftmap(name, driftmap){
	console.log("name: " + name);
	
	console.log("driftmap: " + JSON.stringify(driftmap));

	var init_x = driftmap.layer.initPt.lat || 43.236;
	var init_y = driftmap.layer.initPt.lng || 28.880;
	var zoom 	 = driftmap.layer.initZoom   || 14;

	map = L.map('profile-map').setView([init_x, init_y], zoom);

	// TODO make this API key a Server environment variable
	L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token={accessToken}', {
  	attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, <a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="http://mapbox.com">Mapbox</a>',
  	maxZoom: 18,
  	id: 'eozelius77.j4hekake',
  	accessToken: 'pk.eyJ1IjoiZW96ZWxpdXM3NyIsImEiOiJkQmhDSl8wIn0.MzOmrtAL3uTNmVfLmEZ57g'
	}).addTo(map);

	if(typeof driftmap.markers === 'undefined' ){
		console.log("this dude aint got no fucking routes.")
	} else {
		console.log("this brother got routes")
	}


}

function flash_now(type, message, dom){
	var flash_msg = '<div style="margin:0; width:100%" class="flash-messages flash-'+ type +' col-lg-12 col-md-12 col-sm-12 col-xs-12"><p class="flash">'+ message +'</p></div>';
	$(dom).append(flash_msg).removeClass('hidden');
}

function xss_trim(str){
	return String(str)
	.replace(/&/g, '&amp;')
	.replace(/"/g, '&quot;')
	.replace(/'/g, '&#39;')
	.replace(/</g, '&lt;')
	.replace(/>/g, '&gt;')
	.replace('/', '&#x2F')
	.trim();
}


