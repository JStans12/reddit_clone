class SubredditsController < ApplicationController
  def index
    @subreddits = Subreddit.my_subs(current_user.token)
  end
end
