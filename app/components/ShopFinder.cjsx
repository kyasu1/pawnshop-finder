React = require('react')
ShopSearch = require('./ShopSearch')
ShopList = require('./ShopList')
SearchByPrefecture = require('./SearchByPrefecture')
Radium = require('radium')
TabGroup = require('./TabGroup')
Tab = require('./Tab')
styles = 
  shop_finder:
    display: 'flex'
    backgroundColor: '#FFF'
    borderLeft: '1px solid #333'
    padding: '10px'
    # height: '50vh'

    # minHeight: '40vh'
    # overflow: 'hidden'
    flex: '0 0 40vh'    
    flexDirection: 'column'

    '@media screen and (min-width: 600px)':
      flex: '0 0 18em'
      height: null

  h3: 
    flex: '0 0 14px'
    textAlign: 'center'
    margin: 0
    padding: 0
    fontSize: 14

  tabgroup:
    flex: '0 0 100px'

  shoplist:
    flex: 1
class ShopFinder extends React.Component
  displayName: 'ShopFinder'

  render: =>
    <aside style={styles.shop_finder} >
      <h3 style={styles.h3}>質屋検索</h3>

      <TabGroup style={styles.tabgroup} >
        <Tab title='キーワード'>
          <ShopSearch {...@props} />
        </Tab>
        <Tab title='都道府県'>
          <SearchByPrefecture {...@props} />
        </Tab>
        <Tab title='路線'>
        </Tab>
      </TabGroup>

      <ShopList {...@props} style={styles.shoplist}/>
    </aside>

module.exports = Radium.Enhancer(ShopFinder)