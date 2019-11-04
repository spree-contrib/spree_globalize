module Spree::StoreDecorator
  def self.prepended(base)
    base.translates :name, :meta_description, :meta_keywords, :seo_title, fallbacks_for_empty_translations: true
  end

  Spree::Store.include SpreeGlobalize::Translatable
end

Spree::Store.prepend Spree::StoreDecorator
