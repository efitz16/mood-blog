class SessionsController < ApplicationController
  def new
  	redirect_to root_url if logged_in?

  	#redirect to user page
  end

  def create
  	@user = User.find_by(email: session_params[:email].downcase)

  	if @user && @user.authenticate(session_params[:password])
      log_in(@user)
      redirect_to root_url
      flash[:notice] = "Logged in successfully"
  	else
  	  flash[:notice] = "Error logging in"
  	  render 'new'
  	end
  end

  def destroy
  	log_out if logged_in?
  	redirect_to root_url
  end

  private
  def session_params
  	params.require(:session).permit(:email, :password)
  end
end
