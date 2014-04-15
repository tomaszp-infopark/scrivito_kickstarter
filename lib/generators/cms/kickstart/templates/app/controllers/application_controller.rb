class ApplicationController < ActionController::Base
  protect_from_forgery

  include ExceptionHandling
  include Authentication
end
