# Based on issue https://github.com/spree-contrib/spree_multi_vendor/issues/104
module Spree::VendorDecorator
  def self.prepended(base)
    base.translates :name, :about_us, :contact_us, :slug, fallbacks_for_empty_translations: true
  end

  Spree::Vendor.include SpreeGlobalize::Translatable
end

::Spree::Vendor.prepend(Spree::VendorDecorator)