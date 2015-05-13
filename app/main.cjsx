React       = require('react')
Rx          = require('rx')

require './scss/main.scss'

ShopData    = require('./ShopData')
ShopStore   = require('./stores/ShopStore')

GMaps       = require('./components/GMaps')
ShopList    = require('./components/ShopList')
App         = require('./components/App')

ShopData.init()

google.maps.event.addListenerAsObservable = (instance, eventName) ->
  Rx.Observable.create (observer) ->
    listener = google.maps.event.addListener(instance, eventName, (eventObject) =>
      observer.onNext(eventObject)
    )

    return () ->
      google.maps.event.removeListener(listener)

ShopStore.subject.subscribe (state) ->
  React.render <ShopList {...state} />, document.getElementById('shop_list')
  React.render <App {...state} />, document.getElementById('main')

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