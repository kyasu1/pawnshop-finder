React = require('react')

class Select extends React.Component
  componentDidMount: =>
    select = React.findDOMNode(@refs.select)
    console.log select.event
    @selectStream = Rx.Observable.fromEvent(select, 'select')
      .map (e) =>
        console.log e
        e.target.value
      .throttle(500)
      .distinctUntilChanged()
      .startWith('')
      .subscribe (value) =>
        console.log "Select: ", value
        if @props.action?
          @props.action(value)

  componentWillUnmount: =>
    @selectStream.dispose()

  render: =>
    <select ref="select" className={@props.className} >
      {@props.children}
    </select>

module.exports = Select