Deface::Override.new(
  virtual_path:  'spree/admin/shipping_methods/index',
  name:          'shipping_methods_translation',
  insert_bottom: 'td.actions',
  text:           <<-HTML
                    <%= link_to_with_icon 'translate', nil, spree.admin_translations_path('shipping_methods', shipping_method.id), title: Spree.t(:'i18n.translations'), class: 'btn btn-sm btn-primary' %>
                  HTML
)
