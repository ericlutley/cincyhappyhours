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

  # In Place form
  $('#update_external_id').click (e) ->
    e.preventDefault()
    console.debug 'Clicked!'
    placeService = new google.maps.places.PlacesService($('#google-places-attribution')[0])
    request =
      name: $('#place_name').val()
      location: new google.maps.LatLng($('#place_latitude').val(),$('#place_longitude').val())
      radius: 500
      types: ['bar']
      rankBy: google.maps.places.RankBy.PROMINENCE
    console.debug request

    placeService.nearbySearch(request, (results, status) =>
      if status == google.maps.places.PlacesServiceStatus.OK
        place = results[0]
        msg = "Is this the correct place?\n\n#{place.name}\n#{place.vicinity}"
        if confirm(msg)
          $('#place_external_id').val(place.place_id)
      else
        alert("Unable to find external ID for place named #{request.name}")
    )

window.receiveLocation = (position) ->
  location = position.coords.latitude + "," + position.coords.longitude
  $("input#address").val(location)
  $("form").submit()
