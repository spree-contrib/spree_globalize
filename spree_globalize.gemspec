# coding: utf-8
lib = File.expand_path('../lib/', __FILE__)
$LOAD_PATH.unshift lib unless $LOAD_PATH.include?(lib)

require 'spree_globalize/version'

Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_globalize'
  s.version     = SpreeGlobalize.version
  s.summary     = 'Provides globalization features for Spreecommerce.'
  s.description = s.summary

  s.author      = 'Sean Schofield'
  s.email       = 'sean.schofield@gmail.com'
  s.homepage    = 'http://spreecommerce.com'
  s.license     = 'BSD-3'

  s.files        = `git ls-files`.split("\n")
  s.test_files   = `git ls-files -- spec/*`.split("\n")
  s.require_path = 'lib'
  s.requirements << 'none'

  spree_version =  '>= 4.2.0.rc5', '< 5.0'
  s.add_dependency 'spree_core', spree_version
  s.add_runtime_dependency 'spree_extension'
  s.add_runtime_dependency 'globalize'
  s.add_runtime_dependency 'spree_i18n'
  s.add_runtime_dependency 'i18n_data'
  s.add_runtime_dependency 'rails-i18n'
  s.add_runtime_dependency 'kaminari-i18n'
  s.add_dependency 'deface', '~> 1.0'

  s.add_development_dependency 'acts_as_paranoid'
  s.add_development_dependency 'spree_dev_tools'
end
