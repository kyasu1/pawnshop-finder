React = require('react')

class Input extends React.Component
  componentDidMount: =>
    search = React.findDOMNode(@refs.input)
    @keyupStream = Rx.Observable.fromEvent(search, 'keyup')
      .map (e) =>
        e.target.value
      .throttle(500)
      .distinctUntilChanged()
      .startWith('')
      .subscribe (value) =>
        @props.action(value)

  componentWillUnmount: =>
    @keyupStream.dispose()

  render: =>
    styles =
      input:
        background: '#FFFFFF'
        border: '1px solid #DCD8D3'
        borderRadius: '2px'
    <div>
      <input style={styles.input} type="text" ref="input" className={@props.className} />
    </div>

module.exports = Input