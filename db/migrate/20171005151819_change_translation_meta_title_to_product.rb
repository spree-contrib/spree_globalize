class ChangeTranslationMetaTitleToProduct < SpreeExtension::Migration[4.2]
  def change
    change_column :spree_product_translations, :meta_title, :string
  end
end
