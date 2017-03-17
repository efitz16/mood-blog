class PostsController < ApplicationController
  def index
  end

  def show
  end

  def new
  	redirect_to root_url if !logged_in?
  	@post = Post.new
  end

  def create
  	@post = Post.new(post_params)
  end

  def edit
  end

  def delete
  end

  private
  def post_params
    params.require(:post).permit(:title, :body)
  end
end
