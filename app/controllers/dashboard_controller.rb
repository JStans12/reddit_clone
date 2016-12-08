class DashboardController < ApplicationController
  def index
    @subreddits = Subreddit.display_names(current_user.token)
  end
end
