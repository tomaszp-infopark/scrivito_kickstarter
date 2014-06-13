def scrivito_config
  YAML.load_file(Rails.root + 'config/scrivito.yml') || {}
rescue Errno::ENOENT
  {}
end

Scrivito.configure do |config|
  config.tenant  = ENV['SCRIVITO_TENANT'] || scrivito_config['tenant']
  config.api_key = ENV['SCRIVITO_API_KEY'] || scrivito_config['api_key']

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

# The application uses separate manifest files for all editing related styles and JavaScript, which
# are only loaded if required. They need to be integrated into Ruby on Rails asset pipeline.
Rails.application.config.assets.precompile += %w(editing.css editing.js)
