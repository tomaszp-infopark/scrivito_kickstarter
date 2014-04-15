def scrival_config
  YAML.load_file(Rails.root + 'config/scrival.yml') || {}
rescue Errno::ENOENT
  {}
end

Scrival.configure do |config|
  config.tenant  = ENV['SCRIVAL_TENANT'] || scrival_config['tenant']
  config.api_key = ENV['SCRIVAL_API_KEY'] || scrival_config['api_key']

  config.choose_homepage do |env|
    Homepage.default
  end

  # This callback is important for security.
  #
  # It is used to provide inplace editing features. Even if you don't use inplace editing
  # on the client side, the server side also uses this callback to determine if CMS data
  # can be modified in the database.
  config.editing_auth do |env|
    EditModeDetection.editing_allowed?(env)
  end
end
