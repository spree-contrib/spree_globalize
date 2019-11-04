Deface::Override.new(
  virtual_path:  'spree/admin/taxonomies/_list',
  name:          'taxonomies_translation',
  insert_bottom: 'td.actions',
  text:           <<-HTML
                    <%= link_to_with_icon 'translate', nil, spree.admin_translations_path('taxonomies', taxonomy.id), title: Spree.t(:'i18n.translations'), class: 'btn btn-sm btn-primary' %>
                  HTML
)
