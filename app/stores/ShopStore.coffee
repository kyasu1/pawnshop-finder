Rx        = require('rx')
update    = require('react/lib/update')
Actions   = require('../actions/ShopActions')
subject   = new Rx.ReplaySubject(1)

state =
  shop: null
  shops: []
  result: []

search_by_keyword = (text) ->
  if text is '' then return []

  state.shops.filter (item, index) ->
    true if item.title.indexOf(text) >= 0 or item.prefecture.indexOf(text) >= 0

search_by_id = (id) ->
  state.shops.filter (item) ->
    true if item.id is id

Actions.subjects.getShopsSubject.subscribe (payload) ->
  state = update state,
    $merge:
      shops: payload.data
  subject.onNext(state)

Actions.subjects.selectShopSubject.subscribe (payload) ->
  shop_in_result = state.result.filter (item) ->
    true if item.id is payload.data.id

  if shop_in_result[0]?
    state = update state,
      $merge:
        shop: payload.data
  else
    result = search_by_id(payload.data.id)
    state = update state,
      $merge:
        shop: payload.data
        result: result

  subject.onNext(state)

Actions.subjects.searchByKeywordSubjct.subscribe (payload) ->
  result = search_by_keyword(payload.data)
  state = update state,
    $merge:
      result: result
  subject.onNext(state)

subject.onNext(state)

module.exports =
  subject: subject

