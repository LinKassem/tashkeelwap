// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require modernizr.custom
//= require jquery
//= require jquery_ujs
//= require foundation
//= require slick.min.js
//= require classie.js

//= require_tree .

$(document).foundation();
// Used to keep the signup dropdown form open if there were errors during registrations
if ($("#display-devise-errors-signup").length > 0){
    $("#signup").addClass("open f-open-dropdown").css("left", "-99999px");
}
if ($("#display-devise-errors-signin").length > 0){
    $("#signin").addClass("open f-open-dropdown").css("left", "-99999px");
}

setTimeout(function(){
	$('#signed-in-label').fadeOut();
}, 5000)