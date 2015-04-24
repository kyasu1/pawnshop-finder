var Webpack = require('webpack');
var WebpackDevServer = require('webpack-dev-server');
var WebpackConfig = require('./../webpack.config.js');
var path = require('path');
var fs = require('fs');
var mainPath = path.resolve(__dirname, '..', 'app', 'main.cjsx');

module.exports = function() {
  // First we fire up Webpack an pass in the configuration we
  // created.
  var compiler = Webpack(WebpackConfig, function() {
    // Due to a bug with the style-Loader we have to "touch" a file
    // to force a rebundle after the initial one. Kudos to my collegue
    // Stephan for thie one
    fs.writeFileSync(mainPath, fs.readFileSync(mainPath).toString());
    console.log('Project is ready!');
  });

  var bundler = new WebpackDevServer(compiler, {
    // We need to tell Webpack to serve out bundled application
    // from the build path. When proxying:
    // http://localhost:3000/build -> http://localhost:8080/build
    publicPath: '/build/',

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
