module Spree::StoreDecorator
  def self.prepended(base)
    base.translates :name, :meta_description, :meta_keywords, :seo_title, fallbacks_for_empty_translations: true
  end
end

class AddTranslationsToStore < SpreeExtension::Migration[4.2]
  def up
    unless table_exists?(:spree_store_translations)
      ::Spree::Store.prepend(Spree::StoreDecorator)
      
      params = { name: :string, meta_description: :text, meta_keywords: :text, seo_title: :string }
      Spree::Store.create_translation_table!(params, { migrate_data: true })
    end
  end

  def down
    Spree::Store.drop_translation_table! migrate_data: true
  end
end