Rx        = require('rx')
update    = require('react/lib/update')
Actions   = require('../actions/ShopActions')
Immutable = require('immutable')

subject   = new Rx.ReplaySubject(1)

# state =
#   shop: null
#   shops: Immutable.List()
#   result: Immutable.List()
#   text: ''

state = 
  shop_id: null
  shops: Immutable.List()
  result: Immutable.List()
  text: ''

search_by_keyword = (text) ->
  if text is '' then return []

  state.shops.filter (item, index) ->
    true if item.get('title').indexOf(text) >= 0 or item.get('prefecture').indexOf(text) >= 0

search_by_id = (id) ->
  state.shops.filter (item) ->
    true if item.get('id') is id

Actions.subjects.getShopsSubject.subscribe (payload) ->
  state.shops = payload.data
  subject.onNext(state)

Actions.subjects.selectShopSubject.subscribe (payload) ->
  shop_in_result = state.result.filter (shop) ->
    shop.get('id') is payload.shop_id

  if shop_in_result.size is -1
    state.result = search_by_id(shop_id)

  state.shop_id = payload.shop_id

  subject.onNext(state)

Actions.subjects.searchByKeywordSubjct
  .subscribe (payload) =>
    result = search_by_keyword(payload.value)
    state.result = result

    subject.onNext(state)

subject.onNext(state)

module.exports =
  subject: subject

