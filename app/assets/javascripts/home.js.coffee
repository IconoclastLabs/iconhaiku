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
    cursor: "move"
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
  line1 = readLine("line1")
  line2 = readLine("line2")
  line3 = readLine("line3")
  haiku = line1 + line2 + line3
  alert(haiku)

readLine = (line) ->
  index = 0
  _.map $("#" + line).children(), (child) ->
    index++
    line + "_slot" + index + "_id=" + $(child).attr("id")
