// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require turbolinks
//= require_tree .

$(".flash").alert();
window.setTimeout(function() { $(".flash").alert().slideUp(); }, 5000);

$(document).ready(function () {
  $("#contract-nav").click(function () {
    // if($("#contract-nav").is(":visible")) {
      $("#expand-nav").fadeOut(function () {
        $("#profile-nav").hide()
        $("#contract-nav").hide()
        $("#expand-nav").show()
        // ('slide', {
        //   direction: "left"
        // }, 500);
      });
  });
  $("#expand-nav").click(function () {
    // if($("#expand-nav").is(":visible")) {
      $("#contract-nav").fadeOut(function () {
        $("#profile-nav").show()
        $("#expand-nav").hide()
        $("#contract-nav").show()
        // ('slide', {
        //   direction: "left"
        // }, 500);
      });
  });
});



// } else {
//   $("#profile-nav").show('slide', {
//     direction: "left"
//   }, 500, function () {
//     $("#expand-nav").fadeIn();
//   });
// }
