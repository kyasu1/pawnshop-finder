React = require('react')

class ShopListItem extends React.Component
  handleClick: =>
    @props.onClick @props.shop

  render: =>
    shop = null
    className = "list-group-item "
    if @props.active
      shop =
        <div>
          <p>{@props.shop.get('title')}</p>
          <p>{@props.shop.get('prefecture') + @props.shop.get('city') + @props.shop.get('street')}</p>
          <p>{@props.shop.get('tel')}</p>
        </div>
      className += " active"
    else
      shop =
        <div>
          <p>{@props.shop.get('title')}</p>
        </div>

    <a href="#" onClick={@handleClick} className={className}>
      {shop}
    </a>

module.exports = ShopListItem