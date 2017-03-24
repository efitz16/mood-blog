class PostsController < ApplicationController
  before_action :login_redirect, except: [:index, :show]
  #before_action :redirect, only: [:edit, :destroy]

  def index
    @posts = Post.where(user_id: params[:user_id]).order(created_at: :desc)
  end

  def show
    @post = Post.find_by(id: params[:id])
  end

  def new
      @post = Post.new

      @title = @post.title
      @body = @post.body

  	  if request.xhr?
        render '_form', layout: false
      else
        render 'new'
    end
  end

  def create
  	@post = Post.new(post_params)
    @post.user = current_user

      if @post.save
        if request.xhr?
          render '_post', layout: false
        else
          redirect_to user_posts_path(user_id: current_user)
        end
      else
        @errors = @post.errors
        if request.xhr?
          render '_new', layout: false
        else
          render 'new'
        end
      end
  end

  def edit
    @post = Post.find_by(id: params[:id])

    redirect

    @title = @post.title
    @body = @post.body
  end

  def update
    @post = Post.find_by(id: params[:id])

    redirect

    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find_by(id: params[:id])

    redirect

    @post.destroy

    redirect_to root_url
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
