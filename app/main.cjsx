React = require('react')
GMaps = require('./components/GMaps')

require './scss/main.scss'

maps = google.maps
evt = maps.event
Rx = require('rx')
ShopData = require('./ShopData')

ShopData.init()

evt.addListenerAsObservable = (instance, eventName) ->
  Rx.Observable.create (observer) ->
    listener = evt.addListener(instance, eventName, (eventObject) =>
      observer.onNext(eventObject)
    )

    return () ->
      evt.removeListener(listener)

# obserbableWatchPosition = ->
#   Rx.Observable.create (observer) -> 
#     id = navigator.geolocation.watchPosition(
#       (pos) =>
#         observer.onNext pos
#       (err) =>
#         observer.onError err
#     )
#     return () =>
#       navigator.geolocation.clearWatch(id)
#   .throttle(250)
#   .map (pos) ->
#     new google.maps.LatLng pos.coords.latitude, pos.coords.longitude
#   .startWith new google.maps.LatLng 35.698363, 139.756125
#   .publish()
#   .refCount()


# obserbableWatchPosition().subscribe(
#   (e) ->
#     console.log e
#   (err) ->
#     console.log "Error: marker.click: ", err
#   (e) ->
#     console.log "Completed: marker.click", e
# )


current = null
if navigator.geolocation
  navigator.geolocation.getCurrentPosition (pos) =>
    current = new google.maps.LatLng pos.coords.latitude, pos.coords.longitude
else
  current = new google.maps.LatLng 35.698363, 139.756125

selected = null

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
        console.log 'componentDidMount: ', pos
        @setState
          current: pos
      (err) ->
        console.log "ERROR: ", err
    )

  componentWillUnmount: =>
    @stream.dispose()

  render: =>
    <GMaps current={@state.current} shops={@props.shops} selected={@props.shop}/>

ShopStore = require('./stores/ShopStore')
ShopList = require('./components/ShopList')

ShopStore.subject.subscribe (state) ->
  React.render <ShopList {...state} />, document.getElementById('shop_list')
  React.render <App {...state} />, document.getElementById('main')
  
# source = Rx.Observable
#   .range(1, 3)
#   .flatMap (v) ->
#     Rx.Observable.range(1,5)
#   .subscribe (v) ->
#     console.log v

# subject = new Rx.ReplaySubject(1)

# subject.onNext('a')
# subject.onNext('b')
# subject.onNext('c')
# subject.onNext('d')
# subject.onNext('e')
# subject.onNext(
#   key: 'INCREMENT_COUNTER'
# )

# subscription = subject.subscribe(
#   (x) ->
#     console.log 'Next: ' + x.toString()
#   (err) ->
#     console.log 'Error: ' + err
#   () ->
#     console.log 'Completed'
# )


# subject.onNext('g')
# subject.onNext('h')

# console.log subscription


# source = Rx.Observable.create (observer) ->
#   observer.onNext(42)
#   observer.onCompleted()

#   return () ->
#     console.log('disposed')

# subscription = source.subscribe(
#   (x) ->
#     console.log 'Next: ' + x.toString()
#   (err) ->
#     console.log 'Error: ' + err
#   () ->
#     console.log 'Completed'
# )

# subscription.dispose()