React = require('react')
ShopSearch = require('./ShopSearch')
ShopList = require('./ShopList')
SearchByPrefecture = require('./SearchByPrefecture')
Radium = require('radium')
TabGroup = require('./TabGroup')
Tab = require('./Tab')
styles = 
  shop_finder:
    backgroundColor: '#F0F0F0'
    borderLeft: '1px solid #333'
    padding: '10px'
    # height: '50vh'

    # minHeight: '40vh'
    # overflow: 'hidden'
    flex: '0 0 40vh'    
    display: 'flex'
    flexDirection: 'column'

    '@media screen and (min-width: 600px)':
      flex: '0 0 18em'
      height: null
      minHeight: null
      # maxHeight: '100%'
  tabs:
    display: 'flex'
    justifyContent: 'space-between'
  tab_label:
    flex: '1 0 0%'
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

      <TabGroup>
        <Tab title='キーワード'>
          <ShopSearch {...@props} />
        </Tab>
        <Tab title='都道府県'>
          <SearchByPrefecture {...@props} />
        </Tab>
        <Tab title='路線'>
        </Tab>
      </TabGroup>

      <ShopList {...@props} />
    </aside>

module.exports = Radium.Enhancer(ShopFinder)