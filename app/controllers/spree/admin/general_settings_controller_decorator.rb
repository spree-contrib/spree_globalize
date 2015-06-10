Spree::Admin::GeneralSettingsController.class_eval do
  before_filter :update_i18n_settings, only: :update

  private
    def update_i18n_settings
      params.each do |name, value|
        next unless Spree::Globalize::Config.has_preference? name
        Spree::Globalize::Config[name] = value.map(&:to_sym)
      end
    end
end
