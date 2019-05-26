// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application
// logic in a relevant structure within app/javascript and only use these pack
// files to reference that code so it'll be compiled.

import './bootstrap.js';
import './font_awesome.js';

const Index = {};

Index.aux = function() {
  $('#target').click(function() {
    alert('Handler for .click() called.');
  });

  $('#other').click(function() {
    $('#target').click();
  });
};

$(document).on('turbolinks:load', function() {
  Index.aux();
});
