jQuery(document).on('turbolinks:load', function() {

  App.status_bar = App.cable.subscriptions.create("StatusBarChannel", {

    connected: function() {
      console.log("Connected to a status bar channel");
    },

    disconnected: function() {

    },
    received: function(data) {
      console.log(data["width"] );
      var size = data["width"] + "%";
      $('.status_bar').css("width", size);
      if (data["width"] == 10) {
        $('.status_button > a').prop('disabled',true);
        $(".status_button > a").html("In progress...");
      }
      if (data["width"] == 100) {
        $('.status_button > a').prop('disabled',false);
        $(".status_button > a").html("Repeat");
      }
    }
  });
});  