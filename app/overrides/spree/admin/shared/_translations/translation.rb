Deface::Override.new(
  virtual_path:  'spree/admin/shared/_translations',
  name:          'translations_translation',
  insert_bottom: 'script',
  text:           <<-HTML
                    $.extend(Spree.translations, { translations: "<%= strip_tags(Spree.t(:'i18n.translations')) %>" })
                  HTML
)
