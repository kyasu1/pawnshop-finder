Rx = require('rx')
Immutable = require('immutable')

make_marker = require('../utils/SVGMarkerIcon')

subjects =
  getShopsSubject: new Rx.Subject()
  selectShopSubject: new Rx.Subject()
  searchByKeywordSubjct: new Rx.Subject()

module.exports =
  subjects: subjects

  getShopsSubject: ->
    data = Immutable.fromJS(JSON.parse(localStorage.getItem('shops'))).toList()

    icon = 
      url: make_marker 'none', null
      anchor: new google.maps.Point 24, 48

    data = data.map (shop) =>
      marker = new google.maps.Marker
        position: new google.maps.LatLng shop.get('lat'), shop.get('lng')
        icon: icon

      icon_with_title = 
        url: make_marker '', shop.get('title')
        anchor: new google.maps.Point 24, 48

      mouseover = Rx.Observable.create (observer) =>
        listener = google.maps.event.addListener marker, 'mouseover', (e) =>
          observer.onNext(shop)
        return =>
          google.maps.event.removeListener(listener)

      marker.mouseover = mouseover.subscribe(
        (shop) =>
          shop.get('marker').setIcon(icon_with_title)
      )

      mouseout = Rx.Observable.create (observer) =>
        listener = google.maps.event.addListener marker, 'mouseout', (e) =>
          observer.onNext(shop)
        return ->
          google.maps.event.removeListener(listener)

      marker.mouseout = mouseout.subscribe(
        (shop) =>
          shop.get('marker').setIcon(icon)
      )

      # google.maps.event.addListener marker, 'mouseover', (e) =>
      #   console.log 'mouseover: ', e
      #   marker.setIcon(icon_with_title)

      # google.maps.event.addListener marker, 'mouseout', (e) =>
      #   if marker.selected is false
      #     marker.setIcon(icon)


      click = Rx.Observable.create (observer) =>
        listener = google.maps.event.addListener marker, 'click', (eventObject) =>
          observer.onNext(shop)
        return ->
          google.maps.event.removeListener(listener)

      marker.subscribe = click.subscribe(
        (shop) =>
          @selectShop(shop)
          shop.get('marker').setIcon(icon_with_title)
      )
      shop = shop.set('marker', marker)
      shop

    subjects.getShopsSubject.onNext
      data: data

  selectShop: (shop) ->
    subjects.selectShopSubject.onNext
      shop: shop

  searchByKeyword: (value) ->
    subjects.searchByKeywordSubjct.onNext
      value: value

  searchByPrefecture: (value) ->
    subjects.searchByKeywordSubjct.onNext
      value: value