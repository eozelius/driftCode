$(function(){
	$('.toggle-sidenav').on('click', function(){
		var active = $('#main').hasClass('active');;
		$('#main').stop().animate({
			left: active ? '-65px' : '0px'
		});
		$('#main').toggleClass('active').css('display', 'block');
	});
});