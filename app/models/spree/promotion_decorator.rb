module Spree
  Promotion.class_eval do
    translates :name, :description, fallbacks_for_empty_translations: true
    include SpreeGlobalize::Translatable
  end
end
