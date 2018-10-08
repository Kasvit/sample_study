jQuery(document).on('turbolinks:load', function() {
    
  $('.close_button_tasks').click(function() {
    Cookies.set('banner', 1, { expires: 7 });
    $('.banner_tasks').hide();
    $('.text_under_banner').html("Your baner been here");
  });

  if(Cookies.get('banner') == null) {
    $('.banner_tasks').show();
  }

  if(Cookies.get('banner') == 1) {
    $('.banner_tasks').hide();
    $('.text_under_banner').html("Your baner been here");
  }
  
});  