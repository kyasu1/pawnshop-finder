React   = require('react')
Rx      = require('rx')
Header  = require('./Header')
Nav     = require('./Nav')
GMaps   = require('./GMaps')
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
    <div className="container">
      <Header />
      <Nav />
      <GMaps current={@state.current} {...@props}/>
      <Footer />
    </div>
module.exports = App