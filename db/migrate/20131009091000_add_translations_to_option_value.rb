class AddTranslationsToOptionValue < ActiveRecord::Migration
  def up
    unless table_exists?(:spree_option_value_translations)
      params = { name: :string, presentation: :string }
      Spree::OptionValue.create_translation_table!(params, { migrate_data: true })
    end
  end

  def down
    Spree::OptionValue.drop_translation_table! migrate_data: true
  end
end
