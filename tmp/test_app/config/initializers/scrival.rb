def content_service_config
  config = YAML.load_file(Rails.root + 'config/scrival.yml')
  config['content_service'] || {}
rescue Errno::ENOENT
  {}
end

def cms_config
  config = YAML.load_file(Rails.root + 'config/scrival.yml')
  config['cms_api'] || {}
rescue Errno::ENOENT
  {}
end

Scrival::Configuration.content_service_url = ENV['CONTENT_SERVICE_URL'] || content_service_config['url']
Scrival::Configuration.content_service_login = ENV['CONTENT_SERVICE_LOGIN'] || content_service_config['login']
Scrival::Configuration.content_service_api_key = ENV['CONTENT_SERVICE_API_KEY'] || content_service_config['api_key']

Scrival::Configuration.cms_url = ENV['CMS_URL'] || cms_config['url']
Scrival::Configuration.cms_login = ENV['CMS_LOGIN'] || cms_config['login']
Scrival::Configuration.cms_api_key = ENV['CMS_API_KEY'] || cms_config['api_key']

Scrival::Configuration.choose_homepage do |env|
  Homepage.for_hostname(Rack::Request.new(env).host)
end

# This callback is important for security.
#
# It is used to provide inplace editing features. Even if you don't use inplace editing
# on the client side, the server side also uses this callback to determine if CMS data
# can be modified in the database.
Scrival::Configuration.editing_auth do |env|
  EditModeDetection.editing_allowed?(env)
end

# Register a JavaScript search API result format used by the media browser.
Scrival::Configuration.register_obj_format('mediabrowser') do |obj|
  format = {
    id: obj.id,
    title: obj.title || obj.name,
  }

  if obj.image?
    format[:preview] = obj.body_data_url
  end

  format
end

# Set cache path outside of the application directory.
Scrival::Configuration.cache_path = "/tmp/cache/#{Rails.root.basename}"
