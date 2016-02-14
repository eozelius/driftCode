$(document).ready(function(){
  // step 1 => 2
	$('.next-signup-text').on('click', function(){
    $('.step-1-slide.signup-text').fadeOut();
    $('.step-2-slide').slideDown('slow').removeClass('hidden');
    $('h3.page-title').text('initialize your driftMap now?');
  });

  // Initial driftMap NOW
  $('.now').on('click', function(){
    $('.step-2-slide').fadeOut();
    $('#now-map-container').slideDown().removeClass('hidden');
    $('h3.page-title').text('give your map a beautiful new name');
    DriftMap.initDriftMap(null, 'map');
  });

  // Initialize driftMap LATER
  $('.later').on('click', function(){
    $('#new_user input[type="text"]').each(function(){
      $(this).val(xss_trim($(this).val()));
    });

    $('#new_user').submit();
  });
});