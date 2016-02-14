function flash_now(type, message, dom){
	var flash_msg = '<div style="margin:0; width:100%" class="flash-messages flash-'+ type +' col-lg-12 col-md-12 col-sm-12 col-xs-12"><p class="flash">'+ message +'</p></div>';
	$(dom).append(flash_msg).removeClass('hidden');
}

/*
function valid_map(driftMap){
	if(typeof driftMap  		    !==         ||
	   typeof driftMap.layer.initPt.lat === 'undefined' ||
	   typeof driftMap.layer.initPt.lng === 'undefined' ||
	   typeof driftMap.layer	    === 'undefined' ||
	   typeof driftmap.title 	    === 'undefined' ||
	   typeof driftmap.body 	    === 'undefined' ||
	   typeof driftmap.layer.initZoom   === 'undefined' )
		{
			console.log("driftmap cannot be undefined");
			return false;
		}
	return true;
}
*/

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
