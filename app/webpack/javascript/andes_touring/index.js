// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application
// logic in a relevant structure within app/javascript and only use these pack
// files to reference that code so it'll be compiled.

import './folio';
import './typed';
import './carousel';
import './isotope';
import './magnifPopup';
import './select2';

$(document).on('turbolinks:load', function() {
  $(':file').filestyle({
  });
});

$(document).on('turbolinks:before-cache', function() {
  $(':file').each(function(index, element) {
    $(element).filestyle('destroy');
  });
});
