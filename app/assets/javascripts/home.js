jQuery(document).on('turbolinks:load', function() {
  var messages = $('#chatbox');
  function init() {
    messages.scrollTop(0);
  }
  window.setTimeout(init, 500);
});