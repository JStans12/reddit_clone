class DashboardController < ApplicationController
  def index
    @subreddits = Subreddit.display_names(current_user.token)
    @posts = Post.top_posts("/r/all/")
  end
end
