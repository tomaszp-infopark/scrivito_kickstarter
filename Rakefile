#!/usr/bin/env rake

require 'bundler/setup'
Bundler::GemHelper.install_tasks

require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec)

require 'scrival_kickstarter/rake/integration_task'
ScrivalKickstarter::Rake::IntegrationTask.new

require 'scrival_kickstarter/rake/travis_task'
ScrivalKickstarter::Rake::TravisTask.new

task default: :spec
