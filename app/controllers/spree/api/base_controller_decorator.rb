module Spree::Api::BaseControllerDecorator
  Spree::Api::BaseController.include(SpreeGlobalize::ControllerGlobalizeHelper)
end
Spree::Api::BaseController.prepend(Spree::Api::BaseControllerDecorator)
