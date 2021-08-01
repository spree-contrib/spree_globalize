class AddDescriptionAndAddressToStore < SpreeExtension::Migration[4.2]
  def change
    reversible do |dir|
      dir.up do
        Spree::Store.add_translation_fields! description: :text, adress: :text
      end

      dir.down do
        remove_columns :spree_store_translations, :description, :adress
      end
    end
  end
end
