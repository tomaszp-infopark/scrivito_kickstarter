gem('scrivito_sdk')
gem('scrivito_editors')

gem_group(:test, :development) do
  gem('scrivito_kickstarter', path: '../../')
  gem('dotenv-rails')
end
