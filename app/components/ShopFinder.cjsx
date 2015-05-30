React = require('react')
ShopSearch = require('./ShopSearch')
ShopList = require('./ShopList')
SearchByPrefecture = require('./SearchByPrefecture')
Radium = require('radium')

styles = 
  shop_finder:
    backgroundColor: '#F0F0F0'
    borderLeft: '1px solid #333'
    padding: '10px'
    maxHeight: '20vh'
    overflow: 'hidden'
    
    display: 'flex'
    flexDirection: 'column'

    '@media screen and (min-width: 600px)':
      flex: '0 0 18em'
      maxHeight: '60vh'
  tabs:
    display: 'flex'
    justifyContent: 'space-between'
  tab_label:
    flex: 1
    border: 'solid 1px #333'
    borderRight: 'none'
    textAlign: 'center'

class ShopFinder extends React.Component
  displayName: 'ShopFinder'

  constructor: (props) ->
    console.log props

  render: =>
    <aside style={styles.shop_finder} >
      <div>質屋検索</div>
      <div style={styles.tabs}>
        <label for="tab1" id="tab1-label" style={styles.tab_label}>キーワード</label>
        <label for="tab2" id="tab2-label" style={styles.tab_label}>都道府県</label>
        <label for="tab3" id="tab3-label" style={[styles.tab_label, {borderRight: 'solid 1px #333'}]}>路線</label>
      </div>
      <div>
        <ShopSearch {...@props} />
        <SearchByPrefecture {...@props} />
      </div>
      <ShopList {...@props} />
    </aside>

module.exports = Radium.Enhancer(ShopFinder)