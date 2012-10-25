// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require jquery.pjax
//= require 'home'
//= require 'buzz'
//= require_tree

$(function() {
  // $('nav a').pjax('[data-pjax-container]')

  // $('[data-pjax-container]').bind("start.pjax", function() {
  //   $('#page').hide(0);
  // }).bind("end.pjax", function() {
  //   $('#page').fadeIn(1000);
  // });

  if (window.location.pathname == "/") {
    var mySound = new buzz.sound( "assets/music", { formats: ["mp3", "ogg"] } );
    mySound.play();

    $("#music").on('click', function(e) {
      e.preventDefault();
      mySound.togglePlay();
      $(this).toggleClass('off on');
    });
  }

});

