module SpreeGlobalize
  # The fact this logic is in a single module also helps to apply a custom
  # locale on the spree/api context since api base controller inherits from
  # MetalController instead of Spree::BaseController
  module ControllerGlobalizeHelper
    extend ActiveSupport::Concern

    included do
      prepend_before_action :globalize_fallbacks

      private

      def globalize_fallbacks
        Fallbacks.config!
      end
    end
  end
end
