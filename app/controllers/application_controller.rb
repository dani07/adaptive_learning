class ApplicationController < ActionController::Base
  include AuthorizeUser
  protect_from_forgery with: :exception

end
