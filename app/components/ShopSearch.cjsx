React     = require('react')
Actions   = require('../actions/ShopActions')
Input     = require('./Input')

class ShopSearch extends React.Component
  render: =>
    <Input action={Actions.searchByKeyword} style={{width: '100%'}} placeholder='キーワードを入力' />

module.exports = ShopSearch