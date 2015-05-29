React     = require('react')
Radium    = require('radium')
Rx        = require('rx')
Actions   = require('../actions/ShopActions')
Overlay   = require('./overlay')

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

  componentWillUpdate: (nextProps, nextState) =>
    @current.setPosition nextProps.current if @props.current isnt nextProps.current

    if @props.shop_id isnt nextProps.shop_id
      shop = nextProps.result.find (shop) =>
        shop.get('id') is nextProps.shop_id
      @map.setCenter new google.maps.LatLng shop.get('lat'), shop.get('lng')
      @map.setZoom 15

    if nextProps.result? and nextProps.result.size > 0 and @props.result isnt nextProps.result
      # compute the new center based on the list
      max_lat = nextProps.result.reduce (p, c) -> if p.get('lat') > c.get('lat') then p else c
      max_lng = nextProps.result.reduce (p, c) -> if p.get('lng') > c.get('lng') then p else c
      min_lat = nextProps.result.reduce (p, c) -> if p.get('lat') < c.get('lat') then p else c
      min_lng = nextProps.result.reduce (p, c) -> if p.get('lng') < c.get('lng') then p else c

      cnt_lat = (max_lat.toJS().lat + min_lat.toJS().lat) * 0.5
      cnt_lng = (max_lng.toJS().lng + min_lng.toJS().lng) * 0.5

      @map.setCenter new google.maps.LatLng cnt_lat, cnt_lng
      @map.setZoom 13

  render: =>
    overlays = @props.result.map (shop, index) =>
      active = shop.get('id') is @props.shop_id
      <Overlay key={index} map={@map} shop={shop} active={active} />

    <section style={[styles.section, @props.style]}>
      <div>
        {overlays}
      </div>
      <div id="map-canvas" style={styles.mapCanvas}>
      </div>
    </section>

styles =
  section:
    position: 'relative'
    flex: 1
  mapCanvas:
    position: 'absolute'
    width: '100%'
    height: '100%'
    zIndex: 10
    # position: 'absolute'
    # top: '100px'
    # bottom: '50px'
    # right: 0
    # left: 0 
    # zIndex: 10
module.exports = Radium.Enhancer(GMaps)
