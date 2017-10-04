class AddTranslationMetaTitleToProduct < ActiveRecord::Migration[4.2]
  def change
    reversible do |dir|
      dir.up do
        Spree::Product.add_translation_fields! meta_title: :text
      end

      dir.down do
        remove_column :spree_product_translations, :meta_title
      end
    end
  end
end