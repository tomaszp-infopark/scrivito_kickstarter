gem('scrival_sdk')
gem('scrival_editors')

gem_group(:test, :development) do
  gem('scrival_kickstarter', path: '../../')
end
