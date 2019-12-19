if Spree.version.to_f >= 4.0
  Deface::Override.new(
    virtual_path:  'spree/admin/general_settings/edit',
    name:          'supported_locales',
    insert_bottom: "[data-hook='general_settings_currency']",
    text:          <<-HTML
                    <div class="card-body pt-0">
                      <div class="form-group">
                        <label for="supported_locales_">
                          <%= Spree.t(:'i18n.supported_locales') %>
                        </label>
                        <%= select_supported_locales %>
                        <p class="help-block">
                          <%= Spree.t(:'globalize.locales_displayed_on_translation_forms') %>
                        </p>
                      </div>
                    </div>
                  HTML
  )
else
  Deface::Override.new(
    virtual_path:  'spree/admin/general_settings/edit',
    name:          'supported_locales',
    insert_bottom: ".panel-default.currency",
    text:          <<-HTML
                    <div class="supported-locales-padding">
                      <div class="form-group" style="padding: 0px 15px;">
                        <label for="supported_locales_">
                          <%= Spree.t(:'i18n.supported_locales') %>
                        </label>
                        <%= select_supported_locales %>
                        <p class="help-block">
                          <%= Spree.t(:'globalize.locales_displayed_on_translation_forms') %>
                        </p>
                      </div>
                    </div>
                  HTML
  )
end
