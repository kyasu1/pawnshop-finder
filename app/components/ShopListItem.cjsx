React = require('react')

class ShopListItem extends React.Component
  handleClick: (e) =>
    @props.onClick @props.shop

  render: =>
    shop = null
    className = "list-group-item "
    if @props.active
      shop =
        <div>
          <p>{@props.shop.title}</p>
          <p>{@props.shop.prefecture + @props.shop.city + @props.shop.street}</p>
          <p>{@props.shop.tel}</p>
        </div>
      className += " active"
    else
      shop =
        <div>
          <p>{@props.shop.title}</p>
        </div>

    <a href="#" onClick={@handleClick} className={className}>
      {shop}
    </a>

module.exports = ShopListItem