React = require('react')
ShopSearch = require('./ShopSearch')
ShopList = require('./ShopList')
SearchByPrefecture = require('./SearchByPrefecture')
Radium = require('radium')

styles = 
  shop_finder:
    position: 'absolute'
    width: '300px'
    height: '40%'
    right: '50px'
    top: '100px'
    padding: '5px'
    zIndex: '20'
    # overflowYy: scroll;
    backgroundColor: '#fff'

    '@media screen and (max-width: 600px)':
      position: 'relative'
      # width: '100%'
      height: 'auto'
      right: 'auto'
      top: 'auto'
      zIndex: 'auto'
      margin: '10px'
      padding: '5px'
      order: '4'
  tabs:
    display: 'flex'
    justifyContent: 'space-between'
  tab_label:
    flex: 1
    border: 'solid 1px #333'
    padding: '1px 1px'
    textAlign: 'center'

class ShopFinder extends React.Component
  displayName: 'ShopFinder'

  constructor: (props) ->
    console.log props

  render: =>
    <aside style={styles.shop_finder} >
      <div className="panel-heading text-center">質屋検索</div>
      <div style={styles.tabs}>
        <label for="tab1" id="tab1-label" style={styles.tab_label}>キーワード</label>
        <label for="tab2" id="tab2-label" style={styles.tab_label}>都道府県</label>
        <label for="tab3" id="tab3-label" style={styles.tab_label}>路線</label>
      </div>
      <div className="panel-body">
        <ShopSearch {...@props} />
        <SearchByPrefecture {...@props} />
      </div>
      <ShopList {...@props} />
    </aside>

module.exports = Radium.Enhancer(ShopFinder)