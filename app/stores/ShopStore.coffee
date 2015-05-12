Rx        = require('rx')
update    = require('react/lib/update')
Actions   = require('../actions/ShopActions')
subject   = new Rx.ReplaySubject(1)

state =
  shop: null
  shops: JSON.parse(localStorage.getItem('shops'))

Actions.subjects.selectShopSubject.subscribe (payload) ->
  state = update(state,
    $merge:
      shop: payload.data
  )
  subject.onNext(state)

subject.onNext(state)

module.exports =
  subject: subject

