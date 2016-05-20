function flash_now(type, message){
	console.log("type: " + type + "\n message: " + message);

	var flash_msg = '<div style="margin:0; width:100%" class="flash-messages flash-'+ type +' col-lg-12 col-md-12 col-sm-12 col-xs-12"><p class="flash">'+ message +'</p></div>';
	$('.application-container').prepend(flash_msg).removeClass('hidden');
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
