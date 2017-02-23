/* NEW ACTION */
$(function(){
  if($('#users_new').length){
    // Cannot upload images larger than 3M
    $('.signup').on('click', function(){
      $('#new_user input[type="text"]').each(function(){
        $(this).val(xss_trim($(this).val()));
      });
      $('#new_user').submit();
    });

    $('#user_profile_pic').on('change', function() {
      var size_in_megabytes = this.files[0].size/1024/1024;
      if (size_in_megabytes > 3){
        alert('Maximum file size is 3MB. Please choose a smaller file.');
        return false;
      }
    });
  }

/* CREATE ACTION */

/* UPDATE ACTION */


/* SHOW ACTION */
  if($('#users_show').length){
    $.ajax({
      url: '/api_profile_page',
      method: 'POST',
      dataType: 'JSON',
      data: { 
        id: $('#user_id').val()
      },
      complete: function(response){
        var r = response.responseJSON
        var home = $('#user_is_home').length ? true : false
        window.r = r

        // init Timeline
        DriftMapTimeline.init(r);

        // init Leaflet
        DriftMapLeaflet.init(r);

        // init Accordian
        DriftMapAccordian.init(r, home);
      }
    });

    // End initial AJAX call

    // DOM event listeners

    // edit profile info
    $('.edit-user-anchor').on('click', function(){
      $('.alter-user-container').slideDown();
      $('.profile-details-container').addClass('form-open');
    });

    // cancel edit user
    $('.cancel-edit-user').on('click', function(){
      $('.alter-user-container').slideUp();
      $('.profile-details-container').removeClass('form-open');
    });
    // End DOM event listeners
  }
});