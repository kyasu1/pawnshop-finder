React = require('react')
OverlayFactory = require('../gmaps/base-overlay-factory')

class Overlay extends React.Component
  componentDidMount: =>
    element = React.findDOMNode(@)

    options =
      point: 
        lat: @props.shop.get('lat')
        lng: @props.shop.get('lng')
      el: element
      map: @props.map

    @overlayInstance = OverlayFactory.create options

  componentWillUnmount: =>
    @overlayInstance.setMap(null)

  handleClick: (e) =>
    # console.log 'click: ', @props.shop.get('title')

  handleMouseOver: (e) =>
    # console.log 'mouseOver: ', e

  handleMouseOut: (e) =>
    # console.log 'mouseOut: ', e
    
  render: =>

    overlayStyle =
      backgroundColor: '#FFF'
      border: '1px solid #000'

    <div className="overlay" style={overlayStyle} onClick={@handleClick} onMouseOver={@handleMouseOver} onMouseOut={@handleMouseOut} >
      <p>
        {@props.shop.get('title')}
      </p>
    </div>

module.exports = Overlay
