var webpack = require('webpack');

module.exports = {
  entry: './app.jsx',
  devtool: 'source-map',
  output: {
    filename: 'bundle.js'
  },
  module: {
    loaders: [
      {
        test: [/\.jsx?$/],
        exclude: /(node_modules)/,
        loader: 'babel-loader',
        query: {
          presets: ['es2015', 'react']
        }
      }
    ]
  },
  resolve: {
    extensions: ['*', '.js', '.jsx']
  }

};
