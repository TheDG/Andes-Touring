import '@fortawesome/fontawesome-free/js/all.js';

$(document).on('turbolinks:load', () => {
  $(function() {
    FontAwesome.dom.i2svg();
  });
});
