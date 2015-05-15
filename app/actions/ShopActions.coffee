Rx = require('rx')

subjects =
  getShopsSubject: new Rx.Subject()
  selectShopSubject: new Rx.Subject()
  searchByKeywordSubjct: new Rx.Subject()

module.exports =
  subjects: subjects

  getShopsSubject: ->
    subjects.getShopsSubject.onNext
      data: JSON.parse(localStorage.getItem('shops'))

  selectShop: (shop) ->
    subjects.selectShopSubject.onNext
      data: shop

  searchByKeyword: (value) ->
    subjects.searchByKeywordSubjct.onNext
      value: value

  searchByPrefecture: (value) ->
    console.log value
    subjects.searchByKeywordSubjct.onNext
      value: value