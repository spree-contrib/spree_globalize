Deface::Override.new(
  virtual_path:  'spree/admin/product_properties/product_property_fields',
  name:          'product_property_translation',
  insert_bottom: 'td.actions',
  text:           <<-HTML
                    <% if f.object.persisted? %>
                      <%= link_to_with_icon 'translate', nil, spree.admin_translations_path('product_property', f.object.id), title: Spree.t(:'i18n.translations'), class: 'btn btn-sm btn-primary' %>
                    <% end %>
                  HTML
)
