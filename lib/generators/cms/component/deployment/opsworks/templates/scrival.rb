
# Set cache path outside of the application directory.
Scrival::Configuration.cache_path = "/tmp/cache/#{Rails.root.basename}"
