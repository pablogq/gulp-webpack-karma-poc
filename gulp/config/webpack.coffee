path = require 'path'

module.exports =
  entry:
    app: [
      './src/styles/webpack-gulp-poc.sass'
      './src/scripts/main.coffee'
    ]
  output:
    path: path.join __dirname, 'assets'
    publicPath: '/assets/'
    filename: '[name].js'
    chunkFilename: '[name].[id].[chunkhash].js'
  resolve:
    extensions: [
      ''
      '.web.coffee', '.web.js', '.web.sass', '.web.css'
      '.coffee', '.js', 'sass', 'css'
    ]
  module:
    loaders: [
      {test: /\.coffee$/, loader: 'coffee'}
      {test: /\.css$/, loader: 'style!css'}
      {test: /\.sass$/, loader: 'style!css!sass'}
    ]
