class RedditServices

  def self.request_user_data(tokens)
    oauth_connection = Faraday.new("https://oauth.reddit.com")
    oauth_connection.authorization(:bearer, tokens[:token])
    user_data = oauth_connection.get("/api/v1/me")
    JSON.parse(user_data.body)
  end
end
