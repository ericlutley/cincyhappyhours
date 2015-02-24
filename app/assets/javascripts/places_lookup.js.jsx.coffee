$ ->
  placesLookupContainer = $('#places-lookup')[0]
  return unless placesLookupContainer

  placeService = new google.maps.places.PlacesService($('#google-places-attribution')[0])
  request = { types: ['bar'], rankBy: google.maps.places.RankBy.DISTANCE }

  window.getUserPosition().then (position) ->
    coords = position.coords
    request.location = new google.maps.LatLng(coords.latitude, coords.longitude)

  PlaceResult = React.createClass
    handleClick: ->
      placeService.getDetails {placeId: @props.id}, (place, status) ->
        if status == google.maps.places.PlacesServiceStatus.OK
          params =
            name: place.name
            address: place.formatted_address
            latitude: place.geometry.location.lat()
            longitude: place.geometry.location.lng()
            external_id: place.place_id
          window.location.href = "/places/new?#{$.param(place: params)}"


    render: ->
      `<li className="place-result" onClick={ this.handleClick } role="button">
        { this.props.name }<br />{ this.props.address }
      </li>`

  PlaceList = React.createClass
    render: ->
      placeNodes = @props.places.map( (place) ->
        `<PlaceResult key={ place.place_id } id={ place.place_id } name={ place.name } address={ place.vicinity } />`
      )
      `<ul className="place-list list-unstyled">
        { placeNodes }
      </ul>`

  SearchForm = React.createClass
    handleSubmit: (e) ->
      e.preventDefault()
      query = @refs.query.getDOMNode().value.trim()
      @props.onFormSubmit(query) if query

    render: ->
      `<form className="searchForm" onSubmit={ this.handleSubmit }>
        <input type="text" placeholder="Search for a place" ref="query" />
        <input type="submit" value="Post" />
      </form>`

  SearchBox = React.createClass
    getInitialState: ->
      places: []

    handleFormSubmit: (query) ->
      request.name = query

      placeService.nearbySearch(request, (results, status) =>
        statusCodes = google.maps.places.PlacesServiceStatus
        if status == statusCodes.OK || status == statusCodes.ZERO_RESULTS
          @setState(places: results[0..5])
        else
          console.error("Place search error: #{status}")
          @setState(places: [])
      )

    render: ->
      `<div className="search-box">
        <SearchForm onFormSubmit={ this.handleFormSubmit }/>
        <PlaceList places={ this.state.places }/>
      </div>`

  React.render `<SearchBox />`, $('#places-lookup')[0]
