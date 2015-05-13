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

  searchByKeyword: (text) ->
    subjects.searchByKeywordSubjct.onNext
      data: text