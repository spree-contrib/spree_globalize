class AddTranslationsToShippingMethod < SpreeExtension::Migration[4.2]
  def up
    params = { name: :string }
    Spree::ShippingMethod.create_translation_table!(params, { migrate_data: true })
  end

  def down
    Spree::ShippingMethod.drop_translation_table! migrate_data: true
  end
end
