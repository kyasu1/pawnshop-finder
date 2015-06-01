React = require('react')
Radium = require('radium')

class Select extends React.Component
  componentDidMount: =>
    select = React.findDOMNode(@refs.select)
    @selectStream = Rx.Observable.fromEvent(select, 'change')
      .map (e) =>
        e.target.value
      .throttle(500)
      .distinctUntilChanged()
      .startWith('')
      .subscribe (value) =>
        if @props.action?
          @props.action(value)

  componentWillUnmount: =>
    @selectStream.dispose()

  render: =>
    styles =
      div:
        display: 'flex'
        width: '100%'
      select:
        flex: '1 0 0%'
        appearance: 'none'
        padding: '5px 5px 5px 5px'
        border: '1px solid #DCD8D3'
        borderRight: 'none'
        borderRadius: '4px 0 0 4px'
        fontSize: '14px'
      span:
        padding: '5px 5px 5px 5px'
        backgroundColor: '#FFFFFF'
        border: '1px solid #DCD8D3'
        borderRadius: '0 4px 4px 0'
        fontSize: '14px'

    <div style={styles.div}>
      <select style={styles.select} ref="select" className={@props.className} >
        {@props.children}
      </select>
      <span style={styles.span}><i class="fa fa-sort-desc">Ｖ</i></span>
    </div>

module.exports = Radium.Enhancer(Select)