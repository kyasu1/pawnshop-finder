Rx = require('rx')
Immutable = require('immutable')

subjects =
  getShopsSubject: new Rx.Subject()
  selectShopSubject: new Rx.Subject()
  searchByKeywordSubjct: new Rx.Subject()

module.exports =
  subjects: subjects

  getShopsSubject: ->
    data = Immutable.fromJS(JSON.parse(localStorage.getItem('shops'))).toList()
    subjects.getShopsSubject.onNext
      data: data

  selectShop: (shop) ->
    subjects.selectShopSubject.onNext
      shop_id: shop.get('id')

  searchByKeyword: (value) ->
    subjects.searchByKeywordSubjct.onNext
      value: value

  searchByPrefecture: (value) ->
    subjects.searchByKeywordSubjct.onNext
      value: value