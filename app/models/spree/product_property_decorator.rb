module Spree
  ProductProperty.class_eval do
    translates :value, fallbacks_for_empty_translations: true
    include SpreeGlobalize::Translatable
  end
end
