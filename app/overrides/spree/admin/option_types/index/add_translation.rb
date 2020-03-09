Deface::Override.new(
  virtual_path:  'spree/admin/option_types/index',
  name:          'option_types_index_translation',
  insert_top:    'td.actions',
  text:          <<-HTML
                  <%= link_to_with_icon 'translate', nil, spree.admin_translations_path('option_types', option_type.id), title: Spree.t(:'i18n.translations'), class: 'btn btn-sm btn-primary' %>
                HTML
)
