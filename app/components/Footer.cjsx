React = require('react')

class Footer extends React.Component
  render: =>
    <footer style={@props.style}>
      <div>
        <div>
          &copy; 2015 Yasuyuki Komatsubara. All rights are reserved.
        </div>
      </div>
    </footer>

module.exports = Footer