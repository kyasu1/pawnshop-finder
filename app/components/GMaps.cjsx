React     = require('react')
Rx        = require('rx')
Actions   = require('../actions/ShopActions')

class GMaps extends React.Component
  constructor: ->
    @state =
      mapOptions:
        zoom: 15
        center: new google.maps.LatLng(35.866426, 139.779734)

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

    @markers = @props.shops.map (shop) =>
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

  componentWillUpdate: (nextProps, nextState) =>
    @current.setPosition nextProps.current if @props.current isnt nextProps.current

    if @props.selected isnt nextProps.selected
      @map.setCenter new google.maps.LatLng nextProps.selected.get('lat'), nextProps.selected.get('lng')
      @map.setZoom 15

    if @props.result isnt nextProps.result
      # compute the new center based on the list
      lat_max = nextProps.result.reduce (prev, curr) ->
        prev.lat > curr.lat

      console.log "lat_max: ", lat_max

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
