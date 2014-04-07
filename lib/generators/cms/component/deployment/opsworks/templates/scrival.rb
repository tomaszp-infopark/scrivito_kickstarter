
Scrival.configure do |config|
  # Set cache path outside of the application directory.
  config.cache_path = "/tmp/cache/#{Rails.root.basename}"
end
