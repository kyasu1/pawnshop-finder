React = require('react')

styles =
  item:
    flex: '1 0 0%'
    textAlign: 'center'    

class Tab extends React.Component
  handleClick: (e) =>
    @props.onClick @props.index

  render: =>
    content = null
    if @props.isSelected
      content = @props.children

    <div onClick={@handleClick} style={styles.item}>
      <h4>{@props.title}</h4>
      {content}      
    </div>

module.exports = Tab