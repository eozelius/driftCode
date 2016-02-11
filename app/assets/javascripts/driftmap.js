$(document).ready(function(){
	var step = 1;
	
	// Dynamically give instructions
	$('.instructions-container .next-step').on('click', function(){
		next_step(step);
		step ++;
	});
});

var driftMapForm = {
	name: 'my drift map',
	init: [40.735, -73.890],
	zoom: 18,
}


var next_step = function(step) {
	$('.current-step p').remove();
	var instructionsHtml = ''

	switch(step) {
    case 1:
    	$('p.instructions').text('Initialize your driftMap.');
    	instructionsHtml = '<p>Position the Map with coordinates, and zoom that you would like.</p>'
    	$('.current-step').append(instructionsHtml);
    	break;
    case 2:



    default:
    	return;
	}
}