$(document).ready(function(){
	console.log("dom loaded");

	// Hover Nav li -> display name
	$('#main ul li').hover( function(){
		var showP = $(this).find('p').first().toggle('fast');
	});

});

