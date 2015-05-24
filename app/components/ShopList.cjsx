React         = require('react')
ShopListItem  = require('./ShopListItem')
Actions       = require('../actions/ShopActions')

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

    <div>
      <div className="list-group">
        {shops}
      </div>
    </div>

module.exports = ShopList