function display_locale_fields() {
  var attr = $('#attr_list a.active').data('attr')
  var locales = $('#locale').val()
  var show = $('select[name="show-only"]').val()
  var fn = function(locale) {
    var display
    var value = $('#attr_fields .panel.' + attr + '.' + locale + ' :input')
      .val()
      .replace(/^\s+|\s+$/g, '')
    if (show === 'incomplete') {
      display = value === ''
    } else if (show === 'complete') {
      display = value !== ''
    } else {
      display = true
    }
    if (display) {
      return $('#attr_fields .panel.' + attr + '.' + locale).show()
    }
  }
  $('#attr_fields .panel').hide()
  var i, len, locale
  for (i = 0, len = locales.length; i < len; i++) {
    locale = locales[i]
    fn(locale)
  }
  if ($('#attr_fields .panel:visible').length === 0 && show !== 'all') {
    $('#attr_fields .no-translations').show()
  }
}

$(function() {
  $('#attr_list a').click(function() {
    $('#attr_list a').removeClass('active')
    $(this).addClass('active')
    display_locale_fields()
    return false
  })
  $('#locale, #supported_locales_').select2({
    placeholder: Spree.translations['please_choose_language']
  })
  $('#locale').change(display_locale_fields)
  $('select[name="show-only"]').change(display_locale_fields)
})
