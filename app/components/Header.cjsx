React = require('react')

class Header extends React.Component
  render: =>
    <header style={@props.style}>
      <div>
        <div>
          Pawnshop Finder in Saitama
        </div>
      </div>
    </header>

module.exports = Header