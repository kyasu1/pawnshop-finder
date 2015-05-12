React = require('react')

class ShopListItem extends React.Component
  handleClick: (e) =>
    @props.onClick @props.shop

  render: =>
    shop = null
    if @props.active
      shop =
        <div>
          <p>{@props.shop.title}</p>
          <p>{@props.shop.prefecture + @props.shop.city + @props.shop.street}</p>
          <p>{@props.shop.tel}</p>
        </div>
    else
      shop =
        <div>
          <p>{@props.shop.title}</p>
        </div>

    <li onClick={@handleClick}>
      {shop}
    </li>

module.exports = ShopListItem