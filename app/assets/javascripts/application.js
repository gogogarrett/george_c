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

$(function() {
  $('nav a').pjax('[data-pjax-container]')

  $('[data-pjax-container]').bind("pjax:beforeSend.pjax", function() {
    // return $('#page').hide(0);
    $('#page').animate({
      height: 0,
      minHeight: 0,
      opacity: 0
    }, 500);
  }).bind("end.pjax", function() {
    $('#page').animate({
      height: 590,
      minHeight: 590,
      opacity: 1
    }, 900);
  });

  // $('[data-pjax-container]').bind("start.pjax", function() {
  //   return $('#page').hide(0);
  // }).bind("end.pjax", function() {
  //   return $('#page').fadeIn(500);
  // });


});
