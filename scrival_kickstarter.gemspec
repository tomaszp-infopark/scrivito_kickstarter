$:.push File.expand_path('../lib', __FILE__)

require 'scrival_kickstarter/version'

Gem::Specification.new do |gem|
  gem.platform    = Gem::Platform::RUBY
  gem.name        = 'scrival_kickstarter'
  gem.version     = ScrivalKickstarter::VERSION
  gem.summary     = 'Scrival Kickstarter'
  gem.description = 'Scrival Kickstarter'

  gem.license = 'LGPLv3'

  gem.authors   = ['Scrival']
  gem.email     = ['support@scrival.com']
  gem.homepage  = 'http://www.scrival.com'

  gem.bindir      = 'bin'
  gem.executables = []
  gem.test_files  = Dir['spec/**/*']
  gem.files       = Dir[
    'lib/**/*',
    'LICENSE',
    'Rakefile',
    'README.md',
    'CHANGELOG.md'
  ]

  gem.add_dependency 'bundler'
  gem.add_dependency 'rails'
  gem.add_dependency 'scrival_sdk'
  gem.add_dependency 'scrival_editors'

  gem.add_development_dependency 'pry'
  gem.add_development_dependency 'rspec-rails'
  gem.add_development_dependency 'generator_spec'
end
