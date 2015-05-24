React = require('react')
OverlayFactory = require('../gmaps/base-overlay-factory')

class Overlay extends React.Component
  componentDidMount: =>
    console.log "mount: ", @props.shop.get('title')
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
    console.log "unmount: ", @props.shop.get('title')

  componentWillUpdate: (nextProps, nextState) =>
    console.log "update: ", nextProps.shop.get('title')
    @overlayInstance.setMap(null)
    @overlayInstance.setPoint
      lat: nextProps.shop.get('lat')
      lng: nextProps.shop.get('lng')
    @overlayInstance.setMap(@props.map)

  handleClick: (e) =>
    console.log 'click: ', @props.shop.get('title')

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
