const path = require('path');
const glob = require('glob');
const MiniCssExtractPlugin = require('mini-css-extract-plugin');
const CopyWebpackPlugin = require('copy-webpack-plugin');
const MinifyPlugin = require('babel-minify-webpack-plugin');

module.exports = (env, options) => ({
  entry: {
    './js/app.js': glob.sync('./vendor/**/*.js').concat(['./js/app.js'])
  },
  output: {
    filename: 'app.js',
    path: path.resolve(__dirname, '../priv/static/js')
  },
  module: {
    rules: [
      {
        test: /\.js$/,
        exclude: /node_modules/,
        use: {
          loader: 'babel-loader'
        }
      },
      {
        test: /\.s?css$/,
        use: [MiniCssExtractPlugin.loader, 'css-loader', 'sass-loader']
      }
    ]
  },
  plugins: [
    new MiniCssExtractPlugin({ filename: '../css/app.css' }),
    new MinifyPlugin(),
    new CopyWebpackPlugin([{ from: 'static/', to: '../' }])
  ]
});
