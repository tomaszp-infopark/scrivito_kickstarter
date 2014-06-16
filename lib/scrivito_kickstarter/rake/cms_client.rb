require 'net/http'
require 'json'

module ScrivitoKickstarter
  module Rake
    class CmsClient
      def reset_cms
        uri = URI("#{url}/workspaces?tenant_name=#{tenant}&revision_id=#{revision_id}")
        request = Net::HTTP::Delete.new(uri.request_uri)
        send_request(request)
      end

      private

      def url
        "https://api.scrivito.com/tenants/#{tenant}"
      end

      def login
        'api_token'
      end

      def tenant
        ENV['SCRIVITO_TENANT']
      end

      def api_key
        ENV['SCRIVITO_API_KEY']
      end

      def revision_id
        uri = URI("#{url}/workspaces/published")
        request = Net::HTTP::Get.new(uri.request_uri)
        send_request(request)['revision_id']
      end

      def http
        @http ||= begin
          uri = URI(url)
          http = Net::HTTP.new(uri.host, uri.port)
          http.use_ssl = true
          http.verify_mode = OpenSSL::SSL::VERIFY_NONE
          http
        end
      end

      def send_request(request)
        request.basic_auth(login, api_key)
        response = http.request(request)
        JSON.parse(response.body)
      end
    end
  end
end
