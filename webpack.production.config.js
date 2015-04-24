var Webpack = require('webpack');
var path = require('path');
var nodeModulesPath = path.resolve(__dirname, 'node_modules');
var buildPath = path.resolve(__dirname, 'public', 'build');
var mainPath = path.resolve(__dirname, 'app', 'main.cjsx');

var config = {
  // We change to nomral source mapping
  devtool: 'source-map',
  entry: mainPath,
  output: {
    path: buildPath,
    filename: 'bundle.js'
  },
  resolve: {
    extensions: ['', '.js', '.cjsx', '.coffee']
  },
  module : {
    loaders: [{
      test: /\.cjsx$/,
      loaders: ['coffee', 'cjsx'],
      exclude: [nodeModulesPath]
    },{
      test: /\.css$/,
      loader: 'style!css'
    }]
  }
};

module.exports = config;
