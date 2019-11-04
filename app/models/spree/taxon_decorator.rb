module Spree::TaxonDecorator
  def self.prepended(base)
    base.translates :name, :description, :meta_title, :meta_description, :meta_keywords,
      :permalink, fallbacks_for_empty_translations: true
  end

  Spree::Taxon.include SpreeGlobalize::Translatable
end

Spree::Taxon.prepend Spree::TaxonDecorator
