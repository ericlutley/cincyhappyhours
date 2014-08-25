# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  $("#open_only").change ->
    $("form").submit()

  $("#use_location").change ->
    if $(this).is(":checked")
      navigator.geolocation.getCurrentPosition(receiveLocation) if navigator.geolocation
    else
      $("input#address").val("")
      $("form").submit()

  $('#browse-places').bind 'ajax:success', (evt, data) ->
    $('.places')[0].innerHTML = data

window.receiveLocation = (position) ->
  location = position.coords.latitude + "," + position.coords.longitude
  $("input#address").val(location)
  $("form").submit()
