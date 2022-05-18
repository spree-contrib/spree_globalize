$( document ).on('turbo:load', function() {
  var display_locale_fields;

  display_locale_fields = function() {
    var attr, locale, locales, show, _fn, _i, _len;
    attr = $('#attr_list a.active').data('attr');
    locale = $('#locale').val();
    available_locales = $('#available_locales').val().split(',');
    show = $("select[name='show-only']").val();
    $('#attr_fields .panel').hide();
    _fn = function(locale) {
      var display, value;
      value = $('#attr_fields .panel.' + attr + '.' + locale + ' :input').val().replace(/^\s+|\s+$/g, "");
      if (show === 'incomplete') {
        display = value === '';
      } else if (show === 'complete') {
        display = value !== '';
      } else {
        display = true;
      }
      if (display) {
        return $('#attr_fields .panel.' + attr + '.' + locale).show();
      }
    };
    if (locale === '') {
      available_locales.forEach(function(locale) { _fn(locale) });
    } else {
      _fn(locale);
    }
    if ($('#attr_fields .panel:visible').length === 0 && show !== 'all') {
      return $('#attr_fields .no-translations').show();
    }
  };

  $('#attr_list a').click(function() {
    $('#attr_list a').removeClass('active');
    $(this).addClass('active');
    display_locale_fields();
    return false;
  });
  $('#locale').change(function() {
    return display_locale_fields();
  });
  return $("select[name='show-only']").change(function() {
    return display_locale_fields();
  });

});
