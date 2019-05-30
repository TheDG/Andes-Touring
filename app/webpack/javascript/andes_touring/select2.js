const Shared = {};

Shared.select2Config = {
  language: 'es',
  width: 'resolve',
  sorter: function(data) {
    return data.sort(function(a, b) {
      a = a.text.toLowerCase();
      b = b.text.toLowerCase();
      if (a > b) {
        return 1;
      } else if (a < b) {
        return -1;
      }
      return 0;
    });
  }
};

Shared.setSelect2 = function() {
  $('.select2').each(function() {
    const $this = $(this);
    const config = Shared.select2Config;
    if ($this.hasClass('allow-clear')) {
      Object.assign(config, {allowClear: true});
    }
    $this.select2(config);
    const value = $this.attr('value');
    if (value) {
      $this.val(value).trigger('change');
    }
  });
};

$(document).on('turbolinks:load', function() {
  Shared.setSelect2();
});

$(document).on('turbolinks:before-cache', function() {
  $('select.select2').each(function(index, element) {
    $(element).select2('destroy');
  });
});
