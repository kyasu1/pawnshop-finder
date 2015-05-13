React = require('react')
ShopSearch = require('./ShopSearch')
ShopList = require('./ShopList')

class ShopFinder extends React.Component
  render: =>
    <div>
      <ShopSearch {...@props} />
      <ShopList {...@props} />
    </div>

module.exports = ShopFinder