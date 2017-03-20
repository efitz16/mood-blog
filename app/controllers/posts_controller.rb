class PostsController < ApplicationController
  before_action :redirect, only: [:edit, :destroy]
  before_action :logged_in?, except: [:index, :show]

  def index
    @posts = Post.find_by(user_id: params[:user_id])
  end

  def show
  end

  def new
  	@post = Post.new
  end

  def create
  	@post = Post.new(post_params)
    @post.user = current_user

    if @post.save
      flash[:success] = "Post succesfully created"
      redirect_to @user.posts
    else
      flash[:error] = "There was an issue creating your blog post"
      render 'new'
    end
  end

  def edit
  end

  def delete
  end

  private
  def post_params
    params.require(:post).permit(:title, :body)
  end

  def redirect
    unless current_user == @post.user
      flash[:notice] = "This action is only permissible for your own posts"
      redirect_to current_user
    end
  end
end
