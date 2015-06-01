React = require('react')
Radium = require('radium')

styles =
  item:
    flex: '1 0 0%'
    textAlign: 'center'
    fontSize: 12

class Tab extends React.Component
  handleClick: (e) =>
    @props.onClick @props.index

  render: =>
    <div onClick={@handleClick} style={[styles.item, @props.style]}>
      <h4>{@props.title}</h4>
    </div>

module.exports = Radium.Enhancer(Tab)