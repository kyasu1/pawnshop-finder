React = require('react')
Radium = require('radium')

class Nav extends React.Component
  render: =>
    <nav style={[@props.style, styles.nav]}>
      <div key=1 style={styles.item}><a className='home' href='#'>ホーム</a></div>
      <div key=2 style={styles.item}><a className='history' href='#'>組合の歴史</a></div>
      <div key=3 style={styles.item}><a className='howto' href='#'>質屋の仕組</a></div>
      <div key=4 style={styles.item}><a className='news' href='#'>お知らせ</a></div>
      <div key=5 style={[styles.item, {borderRight: 'none'}]}><a className='search' href='#'>質屋の検索</a></div>
    </nav>

styles =
  nav:
    display: 'flex'
    flexDirection: 'row'
    height: 40
    margin: 0
    padding: 0
    borderTop: '1px solid #000'
    borderBottom: '1px solid #000'
    textAlign: 'center'

  item:
    flex: 1
    backgroundColor: '#f0f0f0'
    color: '#333'
    borderRight: '1px solid #333'
    padding: '10px 0'
    fontSize: '12px'
    ':hover':
      backgroundColor: '#e0e0e0'


module.exports = Radium.Enhancer(Nav)