class ApplicationController < ActionController::Base
  protect_from_forgery

  # include ForceHttps
  include ExceptionHandling
  include I18nSupport
  include Authentication
end
