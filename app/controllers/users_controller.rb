class UsersController < ApplicationController
  def show
    @user = User.find_by(id: params[:id])
  end

  def new
  	@user = User.new
    redirect_to root_url if logged_in?
  end

  def create
  	@user = User.new(user_params)

  	if @user.save
  	  flash[:success] = "Account created successfully"
  	  log_in @user
  	  redirect_to root_url
  	else
  	  render 'new'
  	end
  end

  def edit
  end

  def delete
  end

  private
  def user_params
  	params.require(:user).permit(:first_name, :last_name, :username, :email, :password)
  end
end
