module PostsHelper
  def creator?(post)
  	logged_in? && current_user == post.user
  end
end
