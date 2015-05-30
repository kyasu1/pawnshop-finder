React = require('react')
Radium = require('radium')

class ShopListItem extends React.Component
  handleClick: =>
    @props.onClick @props.shop

  render: =>
    shop = null
    className = "list-group-item "
    if @props.active
      href = "tel:" + @props.shop.get('tel')
      shop =
        <div>
          <h4 style={styles.title}><a href='#'>{@props.shop.get('title')}</a></h4>
          <p>{@props.shop.get('prefecture') + @props.shop.get('city') + @props.shop.get('street')}</p>
          <a href={href}>{@props.shop.get('tel')}</a>
        </div>
      className += " active"
      styles.item.flex = 2
      styles.item.order = 0
    else
      shop =
        <div>
          <h4 style={styles.title}><a href='#'>{@props.shop.get('title')}</a></h4>
        </div>
      styles.item.flex = 1
      styles.item.order = @props.shop.get('id')

    <li style={styles.item} href="#" onClick={@handleClick} className={className}>
      {shop}
    </li>

styles = 
  item:
    margin: '10px'
    borderRadius: '5px'
    background: '#60B99A'
    color: '#FFF'
    padding: '15px'
    textDecoration: 'none'
    ':hover':
      backgroundColor: '#F9F9F9'
  title:
    margin: '11px 0 0 0'
      
module.exports = Radium.Enhancer(ShopListItem)