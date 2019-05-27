const {
  environment
} = require('@rails/webpacker');

const webpack = require('webpack');
environment.plugins.append('Provide', new webpack.ProvidePlugin({
  $: 'jquery',
  'window.jQuery': 'jquery',
  jQuery: 'jquery',
  Popper: ['popper.js', 'default'],
  Typed: 'typed.js'
}));

module.exports = {
  module: {
    rules: [{
      test: /\.(png|jpg|gif)$/i,
      use: [{
        loader: 'url-loader',
        options: {
          limit: 8192
        }
      }]
    }]
  }
};
module.exports = environment;
