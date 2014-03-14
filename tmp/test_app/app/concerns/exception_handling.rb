module ExceptionHandling
  extend ActiveSupport::Concern

  included do
    unless config.consider_all_requests_local
      rescue_from(RailsConnector::ResourceNotFound, with: :not_found)
      rescue_from(ActiveResource::ResourceNotFound, with: :not_found)
    end
  end

  def not_found
    respond_to do |type|
      type.html do
        options = {
          status: 404,
        }

        @obj = homepage.try(:error_not_found_page)

        if @obj.present?
          options[:template] = "#{@obj.class.to_s.underscore}/index"
        else
          options[:file] = 'public/404'
          options[:layout] = false
        end

        render(options)
      end
      type.all do
        render(nothing: true, status: 404)
      end
    end
  end

  private

  def homepage
    if @obj.respond_to?(:homepage)
      @obj.homepage
    else
      Homepage.for_hostname(request.host)
    end
  end
end
