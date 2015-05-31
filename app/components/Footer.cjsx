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
    minHeight: 30
    backgroundColor: '#444'
    padding: '10px 0'
    textAlign: 'center'

    fontSize: '10'
    flexDirection: 'column'
    '@media screen and (min-width: 600px)':
      flexDirection: 'row'
      fontSize: '14'

module.exports = Radium.Enhancer(Footer)