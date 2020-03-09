Deface::Override.new(
  virtual_path:  'spree/admin/option_types/option_value_fields',
  name:          'option_value_translation',
  insert_bottom: 'td.actions',
  text:           <<-HTML
                    <% if f.object.persisted? %>
                      <%= link_to_with_icon 'translate', nil, spree.admin_translations_path('option_values', f.object.id), title: Spree.t(:'i18n.translations'), class: 'btn btn-sm btn-primary' %>
                    <% end %>
                  HTML
)
