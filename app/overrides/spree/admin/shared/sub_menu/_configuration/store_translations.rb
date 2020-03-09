Deface::Override.new(
  virtual_path:  'spree/admin/shared/sub_menu/_configuration',
  name:          'sub_menu_configuration_translation',
  insert_bottom: "[data-hook='admin_configurations_sidebar_menu']",
  text:           <<-HTML
                    <%= configurations_sidebar_menu_item Spree.t(:'globalize.store_translations'), spree.admin_translations_path('stores', current_store.id)  if can? :manage, Spree::Store %>
                  HTML
)
