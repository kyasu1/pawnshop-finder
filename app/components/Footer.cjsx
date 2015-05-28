React = require('react')
Radium = require('radium')

class Footer extends React.Component
  render: =>
    <footer style={[@props.style, styles.footer]}>
      <div>
        &copy; 2015 Yasuyuki Komatsubara.&nbsp;
      </div>
      <div>
        All rights are reserved.
      </div>
    </footer>

styles =
  footer:
    display: 'flex'
    justifyContent: 'center'
    color: '#F9F9F9'
    width: '100%'
    height: 30
    backgroundColor: '#444'
    padding: 10
    textAlign: 'center'
    '@media screen and (max-width: 600px)':
      fontSize: '10'
      flexDirection: 'column'


module.exports = Radium.Enhancer(Footer)