class SubredditsController < ApplicationController
  def show
    @subreddit = Subreddit.by_name(params[:subreddit])
    @posts = Post.top_posts(@subreddit.data[:url])
    @rules = Rule.subreddit_rules(@subreddit.data[:url])
  end
end
