$(document).ready(function(){
	// Hover Nav li -> display name
	$('#main ul li').hover(function(){
		var showP = $(this).find('p').first().toggle('fast');
	});
});

