jQuery(document).on('turbolinks:load', function() {

  App.chat = App.cable.subscriptions.create("ChatChannel", {

    connected: function() {
      
    },
    disconnected: function() {

    },
    received: function(data) {
      var messages = $("#chatbox");
      messages.prepend(data['message']);
      messages.scrollTop(0);
    }
  });
});