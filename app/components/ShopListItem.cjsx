React = require('react')
Radium = require('radium')

class ShopListItem extends React.Component
  handleClick: =>
    @props.onClick @props.shop

  render: =>
    title = <h4 style={styles.title}>{@props.shop.get('title')}</h4>

    details = null
    className = "list-group-item "
    if @props.active
      href = "tel:" + @props.shop.get('tel')
      details =
        <div>
          <p>{@props.shop.get('prefecture') + @props.shop.get('city') + @props.shop.get('street')}</p>
          <a style={{textDecoration: 'none'}} href={href}>{@props.shop.get('tel')}</a>
        </div>
      styles.item.flex = 2
      styles.item.order = 0
    else
      styles.item.flex = 1
      styles.item.order = @props.shop.get('id')

    <li style={styles.item} onClick={@handleClick}>
      <div>
        {title}
        {details}
      </div>
    </li>

styles = 
  item:
    # margin: '10px'
    borderBottom: '1px solid #111'
    backgroundColor: '#FFF'
    color: '#111'
    padding: '5px'
    textDecoration: 'none'
    ':hover':
      color: '#7F0019'
      backgroundColor: '#EEE'
  title:
    margin: '11px 0 0 0'
    textDecoration: 'none'
      
module.exports = Radium.Enhancer(ShopListItem)