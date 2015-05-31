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
    children = React.Children.map @props.children, (child, index) =>
      
      isSelected = @state.selectedIndex is index
      
      React.cloneElement child,
        index: index
        isSelected: isSelected
        onClick: @handleClick

    <div style={styles.tab_group}>
      {children}
    </div>

styles =
  tab_group:
    display: 'flex'
    flexDirection: 'column'
    '@media screen and (min-width: 600px)':
      flexDirection: 'row'
      justifyContent: 'space-between'

module.exports = Radium.Enhancer(TabGroup)