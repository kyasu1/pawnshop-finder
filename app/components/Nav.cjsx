React = require('react')

class Nav extends React.Component
  render: =>
    <nav>
      <ul className='gnav'>
        <li><a className='home' href='#'>ホーム</a></li>
        <li><a className='history' href='#'>歴史</a></li>
        <li><a className='howto' href='#'>仕組</a></li>
        <li><a className='news' href='#'>お知らせ</a></li>
        <li><a className='search' href='#'>検索</a></li>
      </ul>
    </nav>

module.exports = Nav