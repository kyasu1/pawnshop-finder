React         = require('react')
ShopListItem  = require('./ShopListItem')
Actions       = require('../actions/ShopActions')
Radium        = require('radium')

class ShopList extends React.Component
  constructor: (props) ->
    super()

  handleClick: (shop) ->
    Actions.selectShop(shop)

  render: =>
    shops = []
    if @props.result.size > 0
      shops = @props.result.map (shop, index) =>
        active = shop.get('id') is @props.shop_id
        <ShopListItem key={index} shop={shop} active={active} onClick={@handleClick} />
    else
      shops = null

    <ul style={[styles.list, @props.style]}>
      {shops}
    </ul>

styles =
  list:
    # height: '100%'
    listStyleType: 'none'
    minHeight: '40px'
    height: '40px'
    # maxHeight: 'auto'
    overflow: 'hidden'
    overflowY: 'scroll'
    # '@media screen and (min-width: 600px)':
    #   flexDirection: 'column'

module.exports = Radium.Enhancer(ShopList)