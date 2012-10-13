# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
#

jQuery ->
  $('#line1, #line2, #line3').sortable
    connectWith: ".haikuLine"
    update: ->
      #alert("Updated")
      limitRows()
      #$.post($(@).data('update-url'))
    placeholder: "tileHighlight"
    revert: true
  $('#library li.tile').draggable
    connectToSortable: ".haikuLine"
    helper: "clone"
    revert: "invalid"

limitRows = -> 
  $(".haikuLine").each ->
    $(@).children().slice(3).slideUp()
