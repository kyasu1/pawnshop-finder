React     = require('react')
Rx        = require('rx')
Actions   = require('../actions/ShopActions')

class GMaps extends React.Component
  constructor: ->
    @state =
      mapOptions:
        zoom: 15
        center: new google.maps.LatLng(35.866426, 139.779734)

  setMarkers: (data) =>
    @markers = data.map (shop) =>
      marker = new google.maps.Marker
        map: @map
        position: new google.maps.LatLng shop.get('lat'), shop.get('lng')

      source = Rx.Observable.create (observer) =>
        listener = google.maps.event.addListener marker, 'click', (eventObject) =>
          observer.onNext(shop)
        return ->
          google.maps.event.removeListener(listener)

      marker.subscribe = source.subscribe(
        (shop) =>
          Actions.selectShop(shop)
      )
      marker

  toggleVisibleMarkers: (visible) =>
    affected = @markers.filter (result) =>

    @markers.map (marker) =>
      marker.setVisilbe(visible)

  componentDidMount: =>
    mapOptions = {}
    if @props.current?
      mapOptions:
        center: @props.current
    else
      mapOptions =
        zoom: 15
        center: new google.maps.LatLng(35.866426, 139.779734)

    @map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions)

    @current = new google.maps.Marker
      position: @map.getCenter()
      map: @map

    # @props.shops.map (shop) =>
    #     shop.marker = new google.maps.Marker
    #       map: @map
    #       position: new google.maps.LatLng shop.lat, shop.lng

    #     source = Rx.Observable.create (observer) =>
    #       listener = google.maps.event.addListener shop.marker, 'click', (eventObject) =>
    #         observer.onNext(shop)
    #       return ->
    #         google.maps.event.removeListener(listener)

    #     shop.marker.subscribe = source.subscribe(
    #       (shop) =>
    #         Actions.selectShop(shop)
    #     )

    @setMarkers @props.shops

  componentWillUpdate: (nextProps, nextState) =>
    @current.setPosition nextProps.current if @props.current isnt nextProps.current

    if @props.shop isnt nextProps.shop
      @map.setCenter new google.maps.LatLng nextProps.shop.get('lat'), nextProps.shop.get('lng')
      @map.setZoom 15

    if nextProps.result? and nextProps.size > 0 and @props.result isnt nextProps.result
      # @clearMarkers()
      # @setMarkers nextProps.result

      # compute the new center based on the list
      max_lat = nextProps.result.reduce (p, c) -> if p.get('lat') > c.get('lat') then p else c
      max_lng = nextProps.result.reduce (p, c) -> if p.get('lng') > c.get('lng') then p else c
      min_lat = nextProps.result.reduce (p, c) -> if p.get('lat') < c.get('lat') then p else c
      min_lng = nextProps.result.reduce (p, c) -> if p.get('lng') < c.get('lng') then p else c

      console.log "max_lat: ", max_lat.get('lat')

  placeMarker: (location) ->
    marker = new google.maps.Marker
      position: location
      map: @map

  render: =>
    <section>
      <div id="map-canvas">
      </div>
    </section>

module.exports = GMaps
