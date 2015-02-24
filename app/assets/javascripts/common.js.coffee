window.getUserPosition = ->
  promise = new Promise (resolve, reject) ->
    if navigator.geolocation
      navigator.geolocation.getCurrentPosition(resolve, reject)
    else
      reject("Geolocation not supported on this platform")
