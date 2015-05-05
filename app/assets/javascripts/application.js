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
//= require classie.js
//= require jquery.slick
//= require ion.sound.js

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

$('.single-item').slick({
  dots:true,
  arrows: true,
  autoplay:true,
  autoplaySpeed: 2500,
  slidesToShow: 1,
  slidesToScroll: 1,
  rtl: true,
  centerMode: true,
});	

// Prevent the backspace key from navigating back.
$(document).unbind('keydown').bind('keydown', function (event) {
    var doPrevent = false;
    if (event.keyCode === 8) {
        var d = event.srcElement || event.target;
        if ((d.tagName.toUpperCase() === 'INPUT' && 
             (
                 d.type.toUpperCase() === 'TEXT' ||
                 d.type.toUpperCase() === 'PASSWORD' || 
                 d.type.toUpperCase() === 'FILE' || 
                 d.type.toUpperCase() === 'EMAIL' || 
                 d.type.toUpperCase() === 'SEARCH' || 
                 d.type.toUpperCase() === 'DATE' )
             ) || 
             d.tagName.toUpperCase() === 'TEXTAREA') {
            doPrevent = d.readOnly || d.disabled;
        }
        else {
            doPrevent = true;
        }
    }

    if (doPrevent) {
        event.preventDefault();
    }
});