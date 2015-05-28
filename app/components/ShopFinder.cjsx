React = require('react')
ShopSearch = require('./ShopSearch')
ShopList = require('./ShopList')
SearchByPrefecture = require('./SearchByPrefecture')
StyleSheet = require('react-style')

styles = StyleSheet.create
  shop_finder:
    position: 'absolute'
    width: '300px'
    height: '40%'
    right: '50px'
    top: '100px'
    padding: '20px'
    zIndex: '20'
    # overflowYy: scroll;
    backgroundColor: '#fff'

  '@media screen and (max-width: 600px)':
    shop_finder:
      position: 'static'
      width: '100%'
      height: 'auto'
      right: 'auto'
      top: 'auto'
      zIndex: '20'
      margin: '10px'
      order: '4'

class ShopFinder extends React.Component
  displayName: 'ShopFinder'

  constructor: (props) ->
    console.log props

  render: =>
    <div style={styles.shop_finder} >
      <div className="panel-heading text-center">質屋検索</div>
      <div className="panel-body">
        <ShopSearch {...@props} />
        <SearchByPrefecture {...@props} />
      </div>
      <ShopList {...@props} />
    </div>

module.exports = ShopFinder