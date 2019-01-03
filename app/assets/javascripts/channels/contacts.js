jQuery(document).on('turbolinks:load', function() {

  var count = 0;
  App.contacts = App.cable.subscriptions.create("ContactsChannel", {

    connected: function() {
      // console.log("Connected to contacts channel");
    },

    disconnected: function() {

    },
    received: function(data) {
      console.log(data);
      var id = data["id"];
      var first_name = data["first_name"];
      var last_name = data["last_name"];
      var tbody = $(".my_table").find('tbody');
      var tr = $('<tr>');
      var td_id = $('<td>').text(id);
      var td_first_name = $('<td>').text(first_name);
      var td_last_name = $('<td>').text(last_name);
      tbody.append(tr.append(td_id).append(td_first_name).append(td_last_name));
      $('.uploading_status').html("Result");
      count++ ;
      $('.table_visible').show();
      $('.users_count').html(count);
      
    }
  });
});  