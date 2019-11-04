module Spree::ProductPropertyDecorator
  def self.prepended(base)
    base.translates :value, fallbacks_for_empty_translations: true
  end

  Spree::ProductProperty.include SpreeGlobalize::Translatable
end

Spree::ProductProperty.prepend Spree::ProductPropertyDecorator
