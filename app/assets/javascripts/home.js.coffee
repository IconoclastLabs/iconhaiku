# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
#

jQuery ->
  $('#line1, #line2, #line3').sortable
    connectWith: ".haikuLine"
    update: ->
      limitRows()
      #$.post($(@).data('update-url'))
      #alert($(@).sortable('serialize'))
    placeholder: "tileHighlight"
    revert: true
    change: (event, ui) ->
      showPendingDoom()
  # stop elements inside draggables from being selected
  $( "ul, li" ).disableSelection()

limitRows = -> 
  $(".haikuLine").each ->
    $(@).children().removeClass("dying")
    $(@).children().slice($(@).data('limit')).slideUp "normal", ->
      $(@).remove()

showPendingDoom = (event, ui) ->
  $(".haikuLine").each ->
    $(@).children().removeClass("dying")
    $(@).children().not(".ui-sortable-helper").slice($(@).data('limit')).addClass("dying")

