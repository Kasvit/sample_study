jQuery(document).on('turbolinks:load', function() {
  $('.item').matchHeight();

  function greeting() {
    $('#greeting').modal("show");  
    Cookies.set('greeting_timer', Date($.now()), { expires: 1 });
  }

  if(Cookies.get('greeting_timer') == null) {
    setTimeout(greeting, 2000); 
  }
});

