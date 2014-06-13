ENV['RAILS_ENV'] ||= 'test'

# Copy config files to dummy app! This has to be done before the
# rails env is loaded
require File.expand_path('../../lib/scrivito_kickstarter/rake/configuration_helper', __FILE__)
dummy_config_path = File.expand_path('../dummy/config', __FILE__)
ScrivitoKickstarter::Rake::ConfigurationHelper.new(dummy_config_path).copy

require 'spec_helper'
require File.expand_path('../dummy/config/environment.rb', __FILE__)
require 'rspec/rails'

# Requires supporting ruby files with custom matchers and macros, etc, in
# spec/support/ and its subdirectories. Files matching `spec/**/*_spec.rb` are
# run as spec files by default. This means that files in spec/support that end
# in _spec.rb will both be required and run as specs, causing the specs to be
# run twice. It is recommended that you do not name files matching this glob to
# end with _spec.rb. You can configure this pattern with with the --pattern
# option on the command line or in ~/.rspec, .rspec or `.rspec-local`.
Dir[Rails.root.join('spec/support/**/*.rb')].each { |file| require file }
