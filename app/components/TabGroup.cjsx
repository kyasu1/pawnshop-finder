React = require('react')
Radium = require('radium')


class TabGroup extends React.Component
  constructor: (props) ->
    @state =
      selectedIndex: props.selectedIndex or 0

  handleClick: (index) =>
    @setState
      selectedIndex: index

  render: =>
    selectedPanel = null

    children = React.Children.map @props.children, (child, index) =>
      
      isSelected = @state.selectedIndex is index
      if isSelected
        selectedPanel = child.props.children

      React.cloneElement child,
        index: index
        isSelected: isSelected
        onClick: @handleClick

    <div style={[styles.body, @props.style]}>
      <div style={styles.headers}>
        {children}
      </div>
      <div style={styles.panel}>
        {selectedPanel}
      </div>
    </div>

styles =
  body:
    display: 'flex'
    flexDirection: 'column'

  headers:
    display: 'flex'
    flex: '1 0 0%'
    justifyContent: 'space-between'

  panel:
    flex: '1 0 0%'
    
module.exports = Radium.Enhancer(TabGroup)