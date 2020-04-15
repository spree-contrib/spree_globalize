# Based on issue https://github.com/spree-contrib/spree_multi_vendor/issues/104
class AddTranstationToVendor < ActiveRecord::Migration[6.0]
  def up
    unless table_exists?(:spree_vendor_translations)
      params = { name: :string, about_us: :text, contact_us: :text, slug: :string }
      Spree::Vendor.create_translation_table!(params, { migrate_data: true })
    end
  end

  def down
    Spree::Vendor.drop_translation_table! migrate_data: true
  end
end
