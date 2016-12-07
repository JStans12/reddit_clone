module ApplicationHelper
  def login
    "https://www.reddit.com/api/v1/authorize?client_id=#{ENV['reddit_client_id']}&response_type=code&state=#{@reddit_state}&redirect_uri=http://localhost:3000/auth/reddit/callback&duration=permanent&scope=identity mysubreddits read save submit subscribe vote"
  end
end
