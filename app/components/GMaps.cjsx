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

    @shopsSource = Rx.Observable.fromArray(@props.shops)
      .map (shop) =>
        shop.marker = new google.maps.Marker
          map: @map
          position: new google.maps.LatLng shop.lat, shop.lng

        source = Rx.Observable.create (observer) =>
          listener = google.maps.event.addListener shop.marker, 'click', (eventObject) =>
            observer.onNext(shop)
          return ->
            google.maps.event.removeListener(listener)

        shop.marker.subscribe = source.subscribe(
          (shop) =>
            Actions.selectShop(shop)
        )
    

    @shopsSource.subscribe()


  componentWillUnmount: =>
    @shopsSource.dispose()


  componentWillUpdate: (nextProps, nextState) =>
    @current.setPosition nextProps.current if @props.current isnt nextProps.current

    if @props.selected isnt nextProps.selected
      @map.setCenter new google.maps.LatLng nextProps.selected.lat, nextProps.selected.lng

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
