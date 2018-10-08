jQuery(document).on('turbolinks:load', function() {
  $('.see_latest_users').hide();
  $('.more_users').hide();
  $('.see_more_users').click(function() {
    $('.see_latest_users').show(1000);
    $('.more_users').show(1000);
    $('.see_more_users').hide(1000);
  });
  $('.see_latest_users').click(function() {
    $('.see_more_users').show(1000);
    $('.more_users').hide(1000);
    $('.see_latest_users').hide(1000);
  });
});