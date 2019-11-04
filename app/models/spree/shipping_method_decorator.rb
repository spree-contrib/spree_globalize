module Spree::ShippingMethodDecorator
  def self.prepended(base)
    base.translates :name, fallbacks_for_empty_translations: true
  end

  Spree::ShippingMethod.include SpreeGlobalize::Translatable
end

Spree::ShippingMethod.prepend Spree::ShippingMethodDecorator
