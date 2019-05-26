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

module.exports = environment;
