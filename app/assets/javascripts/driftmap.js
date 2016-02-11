$(document).ready(function(){
	var step = 1;
	
	// Dynamically give instructions
	$('.instructions-container .next-step').on('click', function(){
		next_step(step);
		step ++;
	});
});

var driftMapForm = {}

/*
	todo: turn all the hiding/showing into a function;
				add a back button 
*/
var next_step = function(step) {
	switch(step) {
    case 1:
    	// Set form properties
    	var title = $('#driftmap-title').val();
    	console.log("title: " + title);
    	driftMapForm.map_title = title;
    	// remove instructions
    	$('.create-step-1').remove();
    	// add next instructions
    	$('.create-step-2').slideDown();
    	break;
    
    case 2:
    	var description = $('#driftmap-body').val();
    	console.log("description: " + description)
    	driftMapForm.map_description = description;
    	$('.create-step-2').remove();
    	$('.create-step-3').slideDown();
    	break;

    case 3:
    	var zoom = map.getZoom();
    	var initCenter = map.getCenter();
    	console.log("init: " + JSON.stringify(initCenter));
    	console.log("zoom: " + zoom)
    	driftMapForm.initPt = initCenter;
    	driftMapForm.initZoom = zoom;
    	$('.create-step-3').remove();
    	$('.create-step-4').slideDown();
    	break;

    case 4:
    	




    default:
    	return;
	}
}