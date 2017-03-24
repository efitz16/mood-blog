class CommentsController < ApplicationController
  before_action :login_redirect, except: [:index, :show]

  def index
    @post = Post.find_by(id: params[:post_id])
    @comments = @post.comments
  end

  def show
  end

  def new
    @comment = Comment.new
    @post = Post.find_by(id: params[:post_id])
    @body = @comment.body
  end

  def create
    @comment = Comment.new(comment_params)

    @comment.user = current_user

    @post = Post.find_by(id: params[:post_id])

    if @comment.save
      @post.comments << @comment
      redirect_to @comment.post
    else
      @errors = @comment.errors
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def comment_params
    params(:commnt).permit(:body)
  end

  def redirect
    unless current_user == @comment.post.user || current_user == @comment.user
      redirect_to root_url
    end
  end
end
