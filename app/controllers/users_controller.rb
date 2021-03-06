class UsersController < ApplicationController
  before_action :login_redirect, only: [:edit, :destroy]

  def index
  end

  def show
    if !!params[:id]
      @user = User.find_by(id: params[:id])
    else
      @user = current_user
    end
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
    @user = User.find_by(id: params[:id])

    redirect
  end

  def update
    @user = User.find_by(id: params[:id])

    redirect

    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render 'edit'
    end

  end

  def destroy
  end

  private
  def user_params
  	params.require(:user).permit(:first_name, :last_name, :username, :email, :password)
  end

  def redirect
    redirect_to user_path(@user) if !(@user == current_user)
  end
end
