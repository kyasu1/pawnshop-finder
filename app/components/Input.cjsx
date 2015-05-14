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
    <div>
      <input type="text" ref="input" className={@props.className} />
    </div>

module.exports = Input