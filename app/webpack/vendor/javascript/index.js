// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application
// logic in a relevant structure within app/javascript and only use these pack
// files to reference that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %>
// to the appropriate layout file, like app/views/layouts/application.html.erb

import './bootstrap_file';
import './font_awesome';
import './magnific-popup';
import 'owl.carousel';
import 'owl.carousel/dist/assets/owl.carousel.css';
import 'select2';
import 'select2/dist/js/i18n/es.js';
import 'select2/dist/css/select2.css';
import './bootstrap_filestyle';

const Isotope = require('isotope-layout');
require('isotope-packery');
const jQueryBridget = require('jquery-bridget');
const imagesLoaded = require('imagesloaded');
// make Isotope a jQuery plugin
jQueryBridget('isotope', Isotope, $);
imagesLoaded.makeJQueryPlugin($);
