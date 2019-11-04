Deface::Override.new(
  virtual_path:  'spree/admin/shared/_product_tabs',
  name:          'product_tabs_translation',
  insert_bottom: "[data-hook='admin_product_tabs']",
  text:          <<-HTML
                  <li class="<%= 'active' if current == 'Translations' %> nav-link">
                    <%= link_to_with_icon 'translate', Spree.t(:'i18n.translations'), spree.admin_translations_url('products', @product.slug), title: Spree.t(:'i18n.translations') %>
                  </li>
                HTML
)
