React   = require('react')
Rx      = require('rx')
Header  = require('./Header')
Nav     = require('./Nav')
GMaps   = require('./GMaps')
ShopFinder = require('./ShopFinder')
Footer  = require('./Footer')

# current = null
# if navigator.geolocation
#   navigator.geolocation.getCurrentPosition (pos) =>
#     current = new google.maps.LatLng pos.coords.latitude, pos.coords.longitude
# else
#   current = new google.maps.LatLng 35.698363, 139.756125

# selected = null

class App extends React.Component
  constructor: ->
    @state =
      current: null

  obserbableWatchPosition: ->
    Rx.Observable.create (observer) -> 
      id = navigator.geolocation.watchPosition(
        (pos) =>
          observer.onNext pos
        (err) =>
          observer.onError err
      )
      return () =>
        navigator.geolocation.clearWatch(id)
    .throttle(250)
    .map (pos) ->
      new google.maps.LatLng pos.coords.latitude, pos.coords.longitude
    .startWith new google.maps.LatLng 35.698363, 139.756125
    .publish()
    .refCount()

  observableGetCurrentPosition: ->
    Rx.Observable.create (observer) -> 
      navigator.geolocation.getCurrentPosition(
        (pos) =>
          observer.onNext pos
        (err) =>
          observer.onError err
        () ->
          console.log "onComplete"
      )
    .map (pos) ->
      new google.maps.LatLng pos.coords.latitude, pos.coords.longitude
 
  componentDidMount: =>
    @stream = @observableGetCurrentPosition()
    @stream.subscribe(
      (pos) =>
        @setState
          current: pos
      (err) ->
        console.log "ERROR: ", err
    )

  componentWillUnmount: =>
    @stream.dispose()

  render: =>
    styles =
      container:
        display: 'flex'
        flexDirection: 'column'
        backgroundColor: '#F9F9F9'
        minHeight: '100%'

      header:
        width: '100%'
        backgroundColor: 'white'
        height: 30
        padding: 10
        textAlign: 'center'
        order: 1

      nav:
        width: '100%'
        backgroundColor: 'white'
        height: 100
        order: 2

      map:
        width: '100%'
        flex: '1 0 auto'
        order: 3
        display: 'flex'

      footer:
        color: '#F9F9F9'
        width: '100%'
        height: 30
        backgroundColor: '#444'
        padding: 10
        textAlign: 'center'
        order: 5

    <div className="container" style={styles.container} >
      <Header style={styles.header} />
      <Nav style={styles.nav} />
      <GMaps style={styles.map} current={@state.current} {...@props}/>
      <ShopFinder {...@props} />
      <Footer style={styles.footer} />
    </div>
module.exports = App