React = require('react')
Radium = require('radium')

class Header extends React.Component
  displayName: 'Header'
  
  render: =>
    styles =
      header:
        # width: '100%'
        backgroundColor: 'white'
        height: 30
        padding: 10
        textAlign: 'center'  

    <header style={[styles.header, @props.style]}>
      <div>
        <div>
          埼玉県質屋組合連合会
        </div>
      </div>
    </header>


module.exports = Radium.Enhancer(Header)