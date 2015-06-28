$(function() {
	// Prepopulate jqte with post body for EDIT
	$('.jqte_editor').html( $('#post_body').html() );

	$('.jqte_editor').on('change', function() {
		$('#post_body').val( $('.jqte_editor').html() );
		console.log("body: " + $('.jqte_editor').html());
	})
});