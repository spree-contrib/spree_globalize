module Spree
  ShippingMethod.class_eval do
    translates :name, fallbacks_for_empty_translations: true
    include Spree::Globalize::Translatable
  end
end
