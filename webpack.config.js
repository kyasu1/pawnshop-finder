var webpack = require('webpack');
var path = require('path');
var nodeModulesPath = path.resolve(__dirname, 'node_modules');
var buildPath = path.resolve(__dirname, 'public', 'build');
var mainPath = path.resolve(__dirname, 'app', 'main.cjsx');

var config = {
  // Makes sure errors in console mapt to the correct file
  // and Line number
  // devtool: 'eval',
  devtool: 'source-map',
  entry: [
    // For hot style updates
    'webpack/hot/dev-server',

    // The script refreshing the browser on none hot updates
    'webpack-dev-server/client?http://localhost:8080',

    'bootstrap-sass/assets/javascripts/bootstrap',
    
    // Our application
    mainPath
  ],
  output: {
    // We need to give Webpack a path. It does not actually need it,
    // because files are kept in memory in webpack-dev-server, but an
    // error will occur if nothing is specified. We use the buildPath
    // as that points to where the files will eventually be bundled
    // in production
    path: buildPath,
    filename: 'bundle.js',

    // Everything related to Webpack should go through a build path,
    // Localhost:3000/build. That makes proxying eaiser to bundle
    publicPath: '/build/'
  },
  resolve: {
    extensions: ['', '.js', '.cjsx', '.coffee']
  },
  module: {
    loaders: [
    // I am using coffescript so the coffee-loader is the choice here.
    {
      test: /\.cjsx$/,
      loaders: ['coffee', 'cjsx'],
      exclude: [nodeModulesPath]
    },

    {
      test: /\.coffee$/,
      loader: 'coffee',
      exclude: [nodeModulesPath]
    },

    // Let also add the style-loader and css-loader, which you can
    // expand with Less-Loader etc.
    {
      test: /\.css$/,
      loader: 'style!css'
    },

    {
      test: /\.scss$/,
      // loader: "style!css!sass?includePaths[]=" + 
      //   path.resolve(__dirname, "./node_modules/bootstrap-sass/assets/stylesheets/")
      loader: "style!css!sass"
    },
    // {
    //   test: /\.scss$/,
    //   loader: "style!css!sass",
    //   include: [
    //     path.resolve(__dirname, "./node_modules/bootstrap-sass/assets/stylesheets/"),
    //     path.resolve(__dirname, "./node_modules/santize.css/")
    //   ]
    // },

    {
      test: /\.jpe?g$|\.gif$|\.png$|\.svg$|\.woff$|\.woff2$|\.eot$|\.ttf$/, loader: "file"
    }
    ]
  },

  // We have to manually add the Hot Replacement plugin when running
  // from Node
  plugins: [
    new webpack.HotModuleReplacementPlugin(),
    new webpack.NoErrorsPlugin()
  ]
};

module.exports = config;
