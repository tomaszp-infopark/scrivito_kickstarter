#!/usr/bin/env rake

require 'bundler/setup'
Bundler::GemHelper.install_tasks

require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec)

require 'scrivito_kickstarter/rake/integration_task'
ScrivitoKickstarter::Rake::IntegrationTask.new

require 'scrivito_kickstarter/rake/travis_task'
ScrivitoKickstarter::Rake::TravisTask.new

task default: :spec
