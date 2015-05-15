React = require('react')

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
    <select ref="select" className={@props.className} >
      {@props.children}
    </select>

module.exports = Select