Rx = require('rx')

subjects =
  selectShopSubject: new Rx.Subject()

module.exports =
  subjects: subjects

  selectShop: (shop) ->
    subjects.selectShopSubject.onNext(
      data: shop
    )
