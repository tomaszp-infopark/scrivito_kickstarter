$LOAD_PATH << File.expand_path('../lib', __FILE__)

require 'scrivito_kickstarter/version'

Gem::Specification.new do |gem|
  gem.platform    = Gem::Platform::RUBY
  gem.name        = 'scrivito_kickstarter'
  gem.version     = ScrivitoKickstarter::VERSION
  gem.summary     = 'Scrivito Kickstarter'
  gem.description = 'Scrivito Kickstarter'

  gem.license = 'LGPL-3.0'

  gem.authors   = ['Scrivito']
  gem.email     = ['support@scrivito.com']
  gem.homepage  = 'http://www.scrivito.com'

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
  gem.add_dependency 'scrivito_sdk', '~> 0.18.0'
  gem.add_dependency 'scrivito_editors'

  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'pry'
  gem.add_development_dependency 'rspec-rails'
  gem.add_development_dependency 'generator_spec'
  gem.add_development_dependency 'dotenv'
  gem.add_development_dependency 'travis'
  gem.add_development_dependency 'coveralls'
end
