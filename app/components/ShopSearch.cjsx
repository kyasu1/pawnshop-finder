React     = require('react')
Actions   = require('../actions/ShopActions')
Input     = require('./Input')

class ShopSearch extends React.Component
  render: =>
    <div className="input-group">
      <Input action={Actions.searchByKeyword} className="form-control" />
    </div>

module.exports = ShopSearch