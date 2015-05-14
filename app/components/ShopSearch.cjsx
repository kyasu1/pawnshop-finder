React = require('react')
Rx = require('rx')
Actions = require('../actions/ShopActions')

# class ShopSearch extends React.Component
#   componentDidMount: =>
#     search = React.findDOMNode(@refs.search)
#     @keyupStream = Rx.Observable.fromEvent(search, 'keyup')
#       .map (e) ->
#         e.target.value
#       .throttle(500)
#       .distinctUntilChanged()
#       .startWith('')
#       .subscribe (text) ->
#         Actions.searchByKeyword(text)

#   componentWillUnmount: =>
#     @keyupStream.dispose()

#   render: =>
#     <div>
#       <input type="text" ref="search" />
#     </div>

class ShopSearch extends React.Component
  constructor: ->
    @state =
      text: ''

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

  handleChange: (e) =>
    @setState
      text: e.target.value

  handleClickClear: () =>
    @setState
      text: ''
      
  render: =>
    <div>
      <input type="text" value={@state.text} ref="search" onChange={@handleChange} />
      <span onClick={@handleClickClear}>X</span>
    </div>


module.exports = ShopSearch