React         = require('react')
ShopListItem  = require('./ShopListItem')
Actions       = require('../actions/ShopActions')

class ShopList extends React.Component
  constructor: (props) ->
    super()

  handleClick: (e) ->
    Actions.selectShop(e)

  render: =>
    shops = []
    if @props.result.length > 0
      shops = @props.result.map (shop, index) =>
        active = shop is @props.shop
        <ShopListItem key={index} shop={shop} active={active} onClick={@handleClick} />
    else
      shops = null

    <div>
      <div className="list-group">
        {shops}
      </div>
    </div>

module.exports = ShopList