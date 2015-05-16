React = require('react')
ShopSearch = require('./ShopSearch')
ShopList = require('./ShopList')
SearchByPrefecture = require('./SearchByPrefecture')

class ShopFinder extends React.Component
  constructor: (props) ->
    console.log props

  render: =>
    <div>
      <div className="panel-heading text-center">質屋検索</div>
      <div className="panel-body">
        <ShopSearch {...@props} />
        <SearchByPrefecture {...@props} />
      </div>
      <ShopList {...@props} />
    </div>

module.exports = ShopFinder