module Spree
  Taxonomy.class_eval do
    translates :name, fallbacks_for_empty_translations: true
    include SpreeGlobalize::Translatable
  end
end
