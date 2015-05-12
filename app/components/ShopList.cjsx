React         = require('react')
ShopListItem  = require('./ShopListItem')
Actions       = require('../actions/ShopActions')

class ShopList extends React.Component
  constructor: (props) ->
    super()

  handleClick: (e) ->
    Actions.selectShop(e)

  render: =>
    shops = @props.shops.map (shop, index) =>
      active = shop is @props.shop
      <ShopListItem key={index} shop={shop} active={active} onClick={@handleClick} />

    <div>
      <ul>
        {shops}
      </ul>
    </div>

module.exports = ShopList