module Spree::TaxonomyDecorator
  def self.prepended(base)
    base.translates :name, fallbacks_for_empty_translations: true
  end

  Spree::Taxonomy.include SpreeGlobalize::Translatable
end

Spree::Taxonomy.prepend Spree::TaxonomyDecorator
