class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include ApplicationHelper
  helper_method :current_user, :logged_in?#, :creator?
end
