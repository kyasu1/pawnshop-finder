React           = require('react')
Actions         = require('../actions/ShopActions')
OverlayFactory  = require('../gmaps/base-overlay-factory')

class Overlay extends React.Component
  constructor: ->
    @state =
      isHovering: false

  componentWillMount: =>
    @normal_svg = 
      <svg width="24" height="24">
        <g>
          <circle id="head-1" fill="#00407E" cx="12" cy="12" r="12"></circle>
          <circle id="head-2" fill="#FFFFFF" cx="12" cy="12" r="10"></circle>
          <circle id="head-3" fill="#00407E" cx="12" cy="12" r="8"></circle>
          <text x="6.5" y="16" fill="white" fontSize="12">質</text>
        </g>
      </svg>    

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

  componentWillReceiveProps: (nextProps) =>
    @setState
      isHovering: nextProps.active    

  componentWillUpdate: (nextProps, nextState) =>
    if nextProps.shop.get('id') isnt @props.shop.get('idf')
      @overlayInstance.setMap(null)
      @overlayInstance.setPoint
        lat: nextProps.shop.get('lat')
        lng: nextProps.shop.get('lng')
      @overlayInstance.setMap(@props.map)

      title = @props.shop.get('title')
      title_length = title.length * 15
      total_length = title_length + 24
      @hover_svg =
        <svg width={total_length} height="24">
          <g>
            <circle id="trail-1" fill="#00407E" cx={title_length + 12} cy="12" r="12"></circle>
            <circle id="trail-2" fill="#FFFFFF" cx={title_length + 12} cy="12" r="10"></circle>
            <circle id="trail-3" fill="#00407E" cx={title_length + 12} cy="12" r="8"></circle>

            <rect id="rect-1" fill="#00407E" x="12" y="0" width={title_length} height="24"></rect>
            <rect id="rect-2" fill="#FFFFFF" x="12" y="2" width={title_length} height="20"></rect>
            <rect id="rect-3" fill="#00407E" x="12" y="4" width={title_length} height="16"></rect>

            <circle id="head-1" fill="#00407E" cx="12" cy="12" r="12"></circle>
            <circle id="head-2" fill="#FFFFFF" cx="12" cy="12" r="10"></circle>
            <circle id="head-3" fill="#00407E" cx="12" cy="12" r="8"></circle>
            <text x="6.5" y="16" fill="#FFFFFF" fontSize="12">質</text>
            <text x="26" y="16" fill="#FFFFFF" fontSize="12">{title}</text>
          </g>
        </svg>

  handleClick: (e) =>
    if @props.active is false
      Actions.selectShop(@props.shop)

  handleMouseEnter: (e) =>
    if @state.isHovering is false
      @setState
        isHovering: true

  handleMouseLeave: (e) =>
    if @props.active is false
      @setState
        isHovering: false

  render: =>
    <div onClick={@handleClick} onMouseEnter={@handleMouseEnter} onMouseLeave={@handleMouseLeave}>
      {if @state.isHovering then @hover_svg else @normal_svg}
    </div>

module.exports = Overlay
