class BaseOverlay extends google.maps.OverlayView
  getOffsetHeightAndWidth: =>
    height: @el.offsetHeight
    width: @el.offsetWidth

  getDimensions: =>
    @getOffsetHeightAndWidth()

  positionOverlayByDimensions: (projectedLatLng) =>
    dimensions = @getDimensions()
    offsetHeight = dimensions.height
    offsetWidth = dimensions.width

    @el.style.top = projectedLatLng.y - offsetHeight + 'px'
    @el.style.left = projectedLatLng.x - Math.floor(offsetWidth / 2) + 'px'

  constructor: (options) ->
    super()

    point = options.point

    @el = options.el.cloneNode(true)

    @point = new google.maps.LatLng(point.lat, point.lng)

    @el.style.position = 'absolute'

  onAdd: () =>
    panes = @getPanes()
    panes.overlayMouseTarget.appendChild(@el)

  onRemove: () =>
    parentEl = @el.parentNode
    parentEl.removeChild(@el)

  draw: () =>
    projection = @getProjection()
    projectedLatLng = projection.fromLatLngToDivPixel(@point)
    @positionOverlayByDimensions projectedLatLng

module.exports = BaseOverlay
