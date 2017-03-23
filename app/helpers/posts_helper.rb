module PostsHelper
  def creator?(user, post)
  	logged_in? && user == post.user
  end
end
