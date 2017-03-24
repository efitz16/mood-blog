module CommentsHelper
  def edit?(comment)
  	logged_in? && current_user == comment.user
  end

  def delete?(comment, post)
  	logged_in? && (current_user == comment.user || current_user == post.user) # or comment.post.user
  end
end
