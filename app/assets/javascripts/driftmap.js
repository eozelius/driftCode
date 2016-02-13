$(document).ready(function(){
	var step = 1;
	
	// Dynamically give instructions
	$('.instructions-container .next-step').on('click', function(){
		next_step(step);
		step ++;
	});
});

var driftMapForm = {
    title: undefined,
    body: undefined,
    driftmapjson: {
        initPt: [0,0],
        initZoom: 12
    }
}

/*
	todo: turn all the hiding/showing into a function;
				add a back button 
*/
var next_step = function(step) {
	switch(step) {
    case 1:
        driftMapForm.user_id = $('#user_id').val()
    	// Set form properties
    	var title = $('#driftmap-title').val();
    	driftMapForm.map_title = title;
    	// remove and show instructions
    	$('.create-step-1').remove();
    	$('.create-step-2').slideDown();
    	break;
    
    case 2:
    	var description = $('#driftmap-body').val();
    	driftMapForm.map_description = description;
    	$('.create-step-2').remove();
    	$('.create-step-3').slideDown();
    	break;

    case 3:
    	var zoom = map.getZoom();
    	var initCenter = map.getCenter();
    	driftMapForm.driftmapjson.initPt = initCenter;
    	driftMapForm.driftmapjson.initZoom = zoom;

    	createDriftMapjson(driftMapForm);

    	$('.create-step-3').remove();
    	$('.create-step-4').slideDown();
    	break;

    default:
    	return;
	}
}

var createDriftMapjson = function(form){
	// error checking
    var url = '/users/'+ form.user_id +'/driftmap'

	$.ajax({
		type: 'post',
		url: url,
		dataType: 'json',
		data: {
			form: JSON.stringify(driftMapForm)
		},
    complete: function(response){
      // Success
      if(response.responseJSON.status == 'success'){
        location.href = response.responseJSON.redirct_url;
      }
      
      // Error
      if(response.responseJSON.status == 'fail'){

      }
		}
	});
}


/*driftMapForm = {
    user_id: 77,
    title: 'asdf',
    body: 'asdfasdafasdfasd',
    initPt: [22, 53.212],
    initZoom: 14
}*/

/* response = {
        "readyState":4,
        "statusText":"OK"
        "status":200,
      
        "responseText":"{
          \"status\":\"success\",
          \"redirct_url\":\"/users/77\"
        }",
      
        "responseJSON":{
          "status":"success",
          "redirct_url":"/users/77"
        },
      }
      */