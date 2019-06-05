import 'bootstrap';

$(document).on('turbolinks:load', () => {
  $(function() {
    $('[data-toggle="popover"]').popover();
    $('[data-toggle="tooltip"]').tooltip();
  });
});
