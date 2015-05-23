React     = require('react')
Rx        = require('rx')
Actions   = require('../actions/ShopActions')
Overlay   = require('./overlay')

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

    # @setMarkers @props.shops

  componentWillUpdate: (nextProps, nextState) =>
    # @current.setPosition nextProps.current if @props.current isnt nextProps.current

    # if @props.shop isnt nextProps.shop
    #   @map.setCenter new google.maps.LatLng nextProps.shop.get('lat'), nextProps.shop.get('lng')
    #   @map.setZoom 15

    # if nextProps.result? and nextProps.result.size > 0 and @props.result isnt nextProps.result
    #   # @clearMarkers()
    #   # @setMarkers nextProps.result

    #   @props.result.map (shop) =>
    #     shop.toJS().marker.setMap(null)
    #   nextProps.result.map (shop) =>
    #     shop.toJS().marker.setMap(@map)

    #   # compute the new center based on the list
    #   max_lat = nextProps.result.reduce (p, c) -> if p.get('lat') > c.get('lat') then p else c
    #   max_lng = nextProps.result.reduce (p, c) -> if p.get('lng') > c.get('lng') then p else c
    #   min_lat = nextProps.result.reduce (p, c) -> if p.get('lat') < c.get('lat') then p else c
    #   min_lng = nextProps.result.reduce (p, c) -> if p.get('lng') < c.get('lng') then p else c

    #   cnt_lat = (max_lat.toJS().lat + min_lat.toJS().lat) * 0.5
    #   cnt_lng = (max_lng.toJS().lng + min_lng.toJS().lng) * 0.5

    #   @map.setCenter new google.maps.LatLng cnt_lat, cnt_lng
    #   @map.setZoom 13

  render: =>
    console.log "result: ", @props.result

    overlays = @props.result.map (shop, index) =>
      <Overlay key={index} map={@map} shop={shop} />

    console.log overlays

    <section>
      <div>
        {overlays}
      </div>
      <div id="map-canvas">
      </div>
    </section>

module.exports = GMaps
