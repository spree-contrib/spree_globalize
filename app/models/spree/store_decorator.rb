module Spree::StoreDecorator
  def self.prepended(base)
    if ::ApplicationRecord.connected? && ::ApplicationRecord.connection.table_exists?(:spree_store_translations)
      base.translates :name, :meta_description, :meta_keywords, :seo_title, fallbacks_for_empty_translations: true
    end
  end

  Spree::Store.include SpreeGlobalize::Translatable
end

::Spree::Store.prepend(Spree::StoreDecorator)