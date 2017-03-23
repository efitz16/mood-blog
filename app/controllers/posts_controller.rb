class PostsController < ApplicationController
  before_action :redirect, only: [:edit, :destroy]
  before_action :logged_in?, except: [:index, :show]

  def index
    @posts = Post.where(user_id: params[:user_id]).order(created_at: :desc)
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
      flash[:notice] = "Post succesfully created"
      redirect_to user_posts_path(user_id: current_user)
    else
      flash[:notice] = "There was an issue creating your blog post"
      @errors = @post.errors
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
