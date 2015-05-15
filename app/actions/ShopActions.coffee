Rx = require('rx')

subjects =
  getShopsSubject: new Rx.Subject()
  selectShopSubject: new Rx.Subject()
  searchByKeywordSubjct: new Rx.Subject()

module.exports =
  subjects: subjects

  getShopsSubject: ->
    data = JSON.parse(localStorage.getItem('shops'))
    subjects.getShopsSubject.onNext
      data: data

  selectShop: (shop) ->
    subjects.selectShopSubject.onNext
      shop: shop

  searchByKeyword: (value) ->
    subjects.searchByKeywordSubjct.onNext
      value: value

  searchByPrefecture: (value) ->
    console.log value
    subjects.searchByKeywordSubjct.onNext
      value: value