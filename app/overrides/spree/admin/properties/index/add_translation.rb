Deface::Override.new(
  virtual_path:  'spree/admin/properties/index',
  name:          'properties_translation',
  insert_bottom: 'td.actions',
  text:           <<-HTML
                    <%= link_to_with_icon 'translate', nil, spree.admin_translations_path('properties', property.id), title: Spree.t(:'i18n.translations'), class: 'btn btn-sm btn-primary' %>
                  HTML
)
