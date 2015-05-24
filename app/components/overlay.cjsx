React = require('react')
Actions       = require('../actions/ShopActions')
OverlayFactory = require('../gmaps/base-overlay-factory')

class Overlay extends React.Component
  constructor: ->
    @state =
      hover: false
      selected: false

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

  componentWillUpdate: (nextProps, nextState) =>
    @overlayInstance.setMap(null)
    @overlayInstance.setPoint
      lat: nextProps.shop.get('lat')
      lng: nextProps.shop.get('lng')
    @overlayInstance.setMap(@props.map)

  handleClick: (e) =>
    if @props.selected
      console.log 'handleClick selected'
    else
      Actions.selectShop(@props.shop)

  handleMouseOver: (e) =>
    console.log 'hover'
    @setState
      hover: true

  handleMouseOut: (e) =>
    if @props.selected is false
      @setState
        hover: true
    else
      @setState
        hover: false

  render: =>
    normal = 
      <svg width="24" height="24">
        <circle id="Oval-2" fill="#00407E" cx="12" cy="12" r="12"></circle>
        <circle id="Oval-3" fill="#FFFFFF" cx="12" cy="12" r="10"></circle>
        <circle id="Oval-4" fill="#00407E" cx="12" cy="12" r="8"></circle>
        <text x="6.5" y="16" fill="white">質</text>
      </svg>

    title = @props.shop.get('title')
    title_length = title.length * 15
    total_length = title_length + 28
    hover =
      <svg width={total_length} height="24">
        <circle id="Oval-1" fill="#00407E" cx={title_length + 12} cy="12" r="12"></circle>
        <circle id="Oval-2" fill="#FFFFFF" cx={title_length + 12} cy="12" r="10"></circle>
        <circle id="Oval-3" fill="#00407E" cx={title_length + 12} cy="12" r="8"></circle>

        <rect id="rect-1" fill="#00407E" x="12" y="0" width={title_length} height="24"></rect>
        <rect id="rect-2" fill="#FFFFFF" x="12" y="2" width={title_length} height="20"></rect>
        <rect id="rect-3" fill="#00407E" x="12" y="4" width={title_length} height="16"></rect>

        <circle id="Oval-1" fill="#00407E" cx="12" cy="12" r="12"></circle>
        <circle id="Oval-2" fill="#FFFFFF" cx="12" cy="12" r="10"></circle>
        <circle id="Oval-3" fill="#00407E" cx="12" cy="12" r="8"></circle>
        <text x="6.5" y="16" fill="#FFFFFF" fontSize="12">質</text>
        <text x="26" y="16" fill="#FFFFFF" fontSize="12">{title}</text>
      </svg>

    <div onClick={@handleClick} onMouseOver={@handleMouseOver} onMouseOut={@handleMouseOut}>
      {if @state.hover then hover else normal}
    </div>
  # render: =>
  #   overlayStyle =
  #     div:
  #       margin: 'auto'
  #       backgroundColor: '#00407E'
  #       border: '2px solid #FFFFFF'
  #       width: '24px'
  #       height: '24px'
  #       borderRadius: '12px'
  #       boxShadow: '0 0 0 3px #00407E'
  #     p:
  #       fontSize: '12px'
  #       marginTop: '2px'
  #       color: '#FFFFFF'
  #       textAlign: 'center'
  #       # fontWeight: 'bold'
  #     span:
  #       display: 'block'
  #       fontSize: '12px'
  #       # position: 'absolute'
  #       # top: '10px'
  #       # left: '24px'
  #       # backgroundColor: '#00407E'
  #       # border: '2px solid #FFFFFF'
  #       # width: 'auto '
  #       # height: '24px'
  #       # borderRadius: '12px'
  #       # boxShadow: '0 0 0 3px #00407E'

  #   title = ''
  #   if @state.hover
  #     title = @props.shop.get('title')

  #   <div className="overlay" onClick={@handleClick} onMouseOver={@handleMouseOver} onMouseOut={@handleMouseOut} >
  #     <div style={overlayStyle.div}>
  #       <p style={overlayStyle.p}>
  #         <span>質</span>
  #       </p>
  #     </div>
  #     <span style={if @state.hover then overlayStyle.span}>{title}</span>
  #   </div>

module.exports = Overlay
