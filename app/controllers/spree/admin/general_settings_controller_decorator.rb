module Spree
  module Admin
    module GeneralSettingsControllerDecorator
      def self.prepended(base)
        base.before_action :update_supported_currencies_settings, only: [:update]
      end

      private

      def update_supported_currencies_settings
        params.each do |name, value|
          next unless SpreeGlobalize::Config.has_preference? name
          SpreeGlobalize::Config[name] = value.map(&:to_sym)
        end
      end
    end
  end
end

::Spree::Admin::GeneralSettingsController.prepend(Spree::Admin::GeneralSettingsControllerDecorator)
