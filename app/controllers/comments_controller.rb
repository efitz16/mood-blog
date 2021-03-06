class CommentsController < ApplicationController
  before_action :login_redirect, except: [:index, :show]

  def index
    @post = Post.find_by(id: params[:post_id])
    @comments = @post.comments

    if request.xhr?
      render 'index', layout: false
    else
      render 'index'
    end
  end

  def show
  end

  def new
    @comment = Comment.new
    @post = Post.find_by(id: params[:post_id])
    @body = @comment.body

    if request.xhr?
      render '_form', layout: false
    else
      render 'new'
    end
  end

  def create
    @comment = Comment.new(comment_params)

    @comment.user = current_user

    @post = Post.find_by(id: params[:post_id])

    @post.comments << @comment

    if @comment.save
      if request.xhr?
        render '_comment', layout: false
      else
        redirect_to @comment.post
      end
    else
      @errors = @comment.errors
      if request.xhr?
        render 'new', layout: false
      else
        render 'new'
      end
    end
  end

  def edit
    @comment = Comment.find_by(id: params[:id])

    redirect

    if @comment
      @post = @comment.post
      @body = @comment.body
      render 'edit'
    else
      redirect_to root_url
    end
  end

  def update
    @comment = Comment.find_by(id: params[:id])

    redirect

    if @comment.update(comment_params)
       redirect_to post_comments_path(@comment.post)
    else
      render 'edit'
    end
  end

  def destroy
    @comment = Comment.find_by(id: params[:id])

    redirect

    @comment.destroy

    redirect_to post_comments_path(@comment.post)
  end

  private
  def comment_params
    params.require(:comment).permit(:body)
  end

  def redirect
    unless current_user == @comment.user || current_user == @comment.post.user
      redirect_to root_url
    end
  end
end
