$ ->
  updatePosition = (position) ->
    location = position.coords.latitude + "," + position.coords.longitude
    locationInput.val(location)
    $('#places-lookup').submit()

  onUpdateError = (error) ->
    alert("Error #{error.code}: #{error.message}")

  locationInput = $('input[type=hidden]#location')
  if locationInput.length && navigator.geolocation
    navigator.geolocation.getCurrentPosition updatePosition, onUpdateError

  $(document).click (e) ->
    target = $(e.target).closest('.facebook-place[role=button]')
    target.find('form').submit()

  $('#places-lookup').on 'ajax:before', ->
    console.debug "Starting search"

  $('#places-lookup').on 'ajax:success', (event, data) ->
    console.debug "Search complete"
    $('#facebook-places').html data
