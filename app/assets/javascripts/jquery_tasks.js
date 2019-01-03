jQuery(document).on('turbolinks:load', function() {
  $(".button_one").on({
    click: function() {
      $(".one").hide();
    },
    dblclick: function() {
      $(".one").show();
    }
  });
  $(".button_two").on({
    mouseenter: function() {
      console.log("Hello!This is alert!");
    },
    click: function() {
      $(".two").toggle();
    }
  });
  $(".button_three").mouseleave(function() {
    alert("Bye!");
  });
  $(".button_four").click(function() {
    $(".line_four").hide(1000);
  });
  $(".button_five").click(function() {
    $(".line_four").fadeTo(1000, 0.8);
  });
  $(".button_six").click(function() {
    $(".line_six_and_half").slideToggle();
  });
  $(".button_six_and_half").click(function() {
    $(".six_and_half").animate({
      padding: "20px",
      opacity: '0.5'
    });
  });
  $(".button_seven").on({
    click: function() {
      console.log("Text: " + $(".seven").text() + " - from target");
    },
    dblclick: function() {
      console.log("HTML: " + $(".seven").html() + " - from target");
    }
  });
  $(".button_eight").click(function() {
    $(".eight").html(function(i, old) {
      console.log(i, old);
      return ("<b>Hello world!</b>");
    });
  });
  $(".button_nine").mouseenter(function() {
    $(".nine").attr("title", $(".nine").text());
  });
  $(".button_ten").click(function() {
    $(".line_ten").append("<td class='appended_td'>additional td here </td>");
  });
  $(".button_eleven").click(function() {
    $("td").remove(".appended_td");
  });
  $(".button_twelve").click(function() {
    $(".twelve").toggleClass("text_changer");
  });
  $(".button_thirteen").click(function() {
    console.log("Font size of 12 text: " + $(".twelve").css("font-size"));
  });
  $(".button_fourteen").click(function() {
    $(".fourteen").parent().css({"background-color": "lightgrey", "font-size": "18px"});
  });
  $(".button_fiveteen").click(function() {
    var position = prompt("Please choose any line", "fiveteen");
    $("table").find("." + position).toggleClass("text_changer");
  });
  $(".button_sixteen").click(function() {
    $.get("http://site.com:3000/jquery_tasks", function(data, status){
      console.log("Data: " + data + "\nStatus: " + status);
    });
  });
  $(".button_seventeen").click(function() {
    console.log("lets start");
    $("tr .position").each(function(index) {
      console.log( index + ": " + $(this).next().text());
    });
    console.log("finish");
  });
});