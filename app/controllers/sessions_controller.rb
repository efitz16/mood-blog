class SessionsController < ApplicationController
  def new
  	redirect_to root_url if logged_in?

  	#redirect to user page
  end

  def create
  	
  end

  def destroy
  	log_out if logged_in?
  	redirect_to root_url
  end
end
