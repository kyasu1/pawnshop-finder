BaseOverlay = require('./base-overlay')

module.exports =
  create: (options) =>
    overlayInstance = new BaseOverlay(options)

    overlayInstance.setMap(options.map)

    overlayInstance