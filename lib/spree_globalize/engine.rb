require 'globalize'

module SpreeGlobalize
  class Engine < Rails::Engine
    engine_name 'spree_globalize'

    config.autoload_paths += %W(#{config.root}/lib)

    initializer "spree_globalize.environment", before: :load_config_initializers do |app|
      SpreeGlobalize::Config = SpreeGlobalize::Configuration.new
    end

    initializer "spree_globalize.permitted_attributes", before: :load_config_initializers do |app|
      taxon_attributes = { translations_attributes: [:id, :locale, :name, :description, :permalink, :meta_description, :meta_keywords, :meta_title] }
      Spree::PermittedAttributes.taxon_attributes << taxon_attributes

      option_value_attributes = { translations_attributes: [:id, :locale, :name, :presentation] }
      Spree::PermittedAttributes.option_value_attributes << option_value_attributes

      store_attributes = { translations_attributes: [:id, :locale, :name, :meta_description, :meta_keywords, :seo_title] }
      Spree::PermittedAttributes.store_attributes << store_attributes
    end

    def self.activate
      Dir.glob(File.join(root, "app/**/*_decorator*.rb")) do |c|
        Rails.configuration.cache_classes ? require(c) : load(c)
      end
    end

    config.to_prepare &method(:activate).to_proc
  end
end
