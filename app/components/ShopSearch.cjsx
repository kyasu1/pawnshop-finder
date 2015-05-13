React = require('react')
Rx = require('rx')
Actions = require('../actions/ShopActions')

class ShopSearch extends React.Component
  componentDidMount: =>
    search = React.findDOMNode(@refs.search)
    @keyupStream = Rx.Observable.fromEvent(search, 'keyup')
      .map (e) ->
        e.target.value
      .throttle(500)
      .distinctUntilChanged()
      .startWith('')
      .subscribe (text) ->
        Actions.searchByKeyword(text)

  componentWillUnmount: =>
    @keyupStream.dispose()

  render: =>
    <div>
      <input type="text" ref="search" />
    </div>

module.exports = ShopSearch