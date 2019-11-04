Deface::Override.new(
  virtual_path:  'spree/admin/promotions/index',
  name:          'promotions_translation',
  insert_bottom: 'td.actions',
  text:           <<-HTML
                    <%= link_to_with_icon 'translate', nil, spree.admin_translations_path('promotions', promotion.id), title: Spree.t(:'i18n.translations'), class: 'btn btn-sm btn-primary' %>
                  HTML
)
