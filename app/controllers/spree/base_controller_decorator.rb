module Spree::BaseControllerDecorator
  Spree::BaseController.include(SpreeGlobalize::ControllerGlobalizeHelper)
end
Spree::BaseController.prepend(Spree::BaseControllerDecorator)
