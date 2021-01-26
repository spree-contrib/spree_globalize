module SpreeGlobalize
  module Generators
    class InstallGenerator < Rails::Generators::Base
      class_option :migrate, type: :boolean, default: true

      def add_javascripts
        append_file "vendor/assets/javascripts/spree/backend/all.js", "//= require spree/backend/spree_globalize\n"
			end

      def add_migrations
        run 'bundle exec rake spree_globalize:install:migrations'
      end

      def run_migrations
        if options[:migrate]
          run 'bundle exec rake db:migrate'
        else
          puts "Skiping rake db:migrate, don't forget to run it!"
        end
      end
    end
  end
end
