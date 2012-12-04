# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
#

haiku = new Object

jQuery ->
  $('#line1, #line2, #line3, #deleteLine').sortable
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
  fetchNewHaiku()

fetchNewHaiku = ->
  # Create a blank haiku object
  $.ajax '/api/haikus/new.json',
  success  : (res, status, xhr) ->
    #console.log(res)
    haiku = res
  error    : (xhr, status, err) ->
    alert("Unable to build Haiku Object")
  complete : (xhr, status) ->

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
  # hydrate the haiku object
  line1 = readLine("line1")
  line2 = readLine("line2")
  line3 = readLine("line3")
  haiku.name = $("#haikuTitle").val()
  sendJSON = api_haiku:
    haiku
  console.log (sendJSON)
  $.ajax
    type: "POST"
    url: $("#haiku").data('update-url')
    data: sendJSON
    success: (res, status, xhr) ->
      console.log(res)
      window.location = "/share/#{res.slug}"

readLine = (line) ->
  $("#" + line).children().each (index) ->
    i = index + 1
    key = line + "_slot" + i + "_id"
    haiku[key] = $(@).children().attr("id")
