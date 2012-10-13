# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
#

jQuery ->
  $('#line1, #line2, #line3').sortable
    connectWith: ".haikuLine"
    update: ->
      alert("Updated")
      #$.post($(@).data('update-url'))
  $('#library li.tile').draggable
    connectToSortable: ".haikuLine"
    helper: "clone"

