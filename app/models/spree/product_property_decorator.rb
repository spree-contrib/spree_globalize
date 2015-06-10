module Spree
  ProductProperty.class_eval do
    translates :value, fallbacks_for_empty_translations: true
    include Spree::Globalize::Translatable
  end
end
