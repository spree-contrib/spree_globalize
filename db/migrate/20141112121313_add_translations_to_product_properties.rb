class AddTranslationsToProductProperties < SpreeExtension::Migration[4.2]
  def up
    unless table_exists?(:spree_product_property_translations)
      params = { value: :string }
      Spree::ProductProperty.create_translation_table!(params, { migrate_data: true })
    end
  end

  def down
    Spree::ProductProperty.drop_translation_table! migrate_data: true
  end
end
