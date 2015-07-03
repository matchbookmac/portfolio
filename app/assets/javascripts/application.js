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

var ready = function() {
  $("#profile-nav").width("150px")

  $("#nav-button").on("click", function(e){
    toggleNav();
  });
};

function toggleNav(){
  if ($("#profile-nav").outerWidth()>100) {
    $("#profile-nav").animate({width:"75px"}, 100);
    $("#profile-nav .nav-group").fadeOut(100);
  } else {
    navWidth="150px";
    $("#profile-nav").animate({width:navWidth}, 100);
    $("#profile-nav .nav-group").fadeIn(100);
    $("#profile-nav .nav-group").animate({color:"#fff"});
  }
}

$(document).ready(ready);
$(document).on("page:load", ready);
