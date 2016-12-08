class DashboardController < ApplicationController
  def index
    @subreddits = Subreddit.by_user(current_user.token)
  end
end
