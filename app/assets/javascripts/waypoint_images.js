$(function(){
  /* NEW */
  if($('.waypoint_image_new').length){
    var photo_index = 0
    $(document).on('click', '.add-photo', function(){
      $(this).data('photo-index', ++photo_index)
      console.log($(this).data('photo-index'))
      var index = $(this).data('photo-index')
      var new_img = '<input class="blip-image" name="photo['+ index +']" accept="image/jpeg, image/gif, image/png, image/jpg" type="file" data-image="'+ index +'" style="margin: 6% 6% 5% 3%; width:100%;">';
      $('.add-photo').last().after(new_img);
    });
  }
});