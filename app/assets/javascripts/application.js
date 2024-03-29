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
//= bootstrap
//= require 'jquery-ui-1.9.0.custom.min.js'
//= require 'underscore-min.js'
//= require 'select2.min.js'
//= require 'angular.min.js'
//= require 'angular-resource.min.js'
//= require 'angular-bootstrap.min.js'
//= require 'api/haikus.js'
//= require 'bootstrap.min.js'
//= require_tree .
/*  Fetch CS for old Haikus
fetchOldHaiku = (haiku_id) ->
  url = "/api/haikus/#{haiku_id}.json"
  $.ajax url,
  success  : (res, status, xhr) ->
    console.log(res)
  error    : (xhr, status, err) ->
    console.log error
  complete : (xhr, status) ->
*/