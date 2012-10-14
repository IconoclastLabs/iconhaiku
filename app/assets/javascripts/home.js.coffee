# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
#

jQuery ->
  $('#line1, #line2, #line3').sortable
    connectWith: ".haikuLine"
    update: ->
      limitRows()
    placeholder: "tileHighlight"
    revert: true
    change: (event, ui) ->
      showPendingDoom()
  # stop elements inside draggables from being selected
  $("ul, li").disableSelection()
  #activate save button
  $('#saveButton').click saveHaiku

limitRows = -> 
  $(".haikuLine").each ->
    $(@).children().removeClass("dying")
    $(@).children().slice($(@).data('limit')).slideUp "normal", ->
      $(@).remove()

showPendingDoom = (event, ui) ->
  $(".haikuLine").each ->
    $(@).children().removeClass("dying")
    $(@).children().not(".ui-sortable-helper").slice($(@).data('limit')).addClass("dying")

saveHaiku = ->
  #$.post($(@).data('update-url'))
  #alert($(@).sortable('serialize'))
  haiku = _.map $("#line1, #line2, #line3").children(), (child) ->
    $(child).text()
  alert(haiku)
