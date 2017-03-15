class SessionsController < ApplicationController
  def destroy
  	log_out if logged_in?
  	redirect_to root_url
  end
end
