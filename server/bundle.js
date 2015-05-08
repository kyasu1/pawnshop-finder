var Webpack = require('webpack');
var WebpackDevServer = require('webpack-dev-server');
var webpackConfig = require('./../webpack.config.js');
// var path = require('path');
// var fs = require('fs');
// var mainPath = path.resolve(__dirname, '..', 'app', 'main.cjsx');

module.exports = function() {
  // First we fire up Webpack an pass in the configuration we
  // created.
  var bundlerStart = null;
  var compiler = Webpack(webpackConfig);

  // We give notice in the terminal when it starts bundling and 
  // set the time it started
  compiler.plugin('compile', function() {
    console.log ('Bundling...');
    bundleStart = Date.now();
  });

  // We also give notice when it is done compiling, including the
  // time it took. Nice to have
  compiler.plugin('done', function(){
    console.log('Bundled in ' + (Date.now() - bundleStart) + 'ms!');
  });

  var bundler = new WebpackDevServer(compiler, {
    // We need to tell Webpack to serve out bundled application
    // from the build path. When proxying:
    // http://localhost:3000/build -> http://localhost:8080/build
    publicPath: '/build/',

    inline: true,
    
    // Configure hot replacement
    hot: true,

    // The rest is terminal configurations
    quiet: false,
    noInfo: true,
    stats: {
      colors: true
    }
  });

  // We fire up the development server
  bundler.listen(8080, 'localhost', function() {
    console.log('Bundling project, please wait...');
  });
};
