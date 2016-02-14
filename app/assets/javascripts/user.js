var step = 1;
var driftMapForm = {
  title: undefined,
  body: undefined,
  layer: {
    initPt: [0,0],
    initZoom: 12
  }
}

$(document).ready(function(){
	// hide/reveal two sections
	$('span.submit-signup-text').on('click', function(){
		$('.signup-text').slideUp();
		$('.signup-driftmap').slideDown('slow');
		$('h3.page-title').text('Initialize your new driftmap');
	});
	
	// Dynamically give instructions
	$('.instructions-container .next-step').on('click', function(){
		next_step(step);
		step ++;
	});
});


/*
	todo: turn all the hiding/showing into a function;
				add a back button 
*/
var next_step = function(step) {
	switch(step) {
    case 1:
    	driftMapForm.title = $('#driftmap-title').val();
    	// remove and show instructions
    	$('.create-step-1').remove();
    	$('.create-step-2').slideDown();
    	break;
    
    case 2:
    	driftMapForm.body = $('#driftmap-body').val();
    	$('.create-step-2').remove();
    	$('.create-step-3').slideDown();
    	break;

    case 3:
    	driftMapForm.layer.initPt = map.getCenter();
    	driftMapForm.layer.initZoom = map.getZoom();
    	createDriftMap(driftMapForm);
    	$('.create-step-3').remove();
    	$('.create-step-4').slideDown();
    	break;

    default:
    	return;
	}
}

/*
var driftMapForm = {
  title: undefined,
  body: undefined,
  layer: {
    initPt: [0,0],
    initZoom: 12
  }
}
*/

var createDriftMap = function(driftMap){
	if(!valid_map(driftMap)){
		flash_now('danger', 'Whoops something went wrong please try again.', '.flash-container')
		return false;
	}

	$('#driftmap').val(JSON.stringify(driftMap));

	$('#new_user input[type="text"]').each(function(){
		$(this).val(xss_trim($(this).val()));
	});

	$('#new_user').submit();
}


function valid_map(driftMap){
	for(var i in driftMap)
		if(typeof driftMap[i] === 'undefined' || driftMap[i] == "")
			return false;
	return true;
}