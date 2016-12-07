class RedditServices

  def initialize(token)
    @token = token
  end

  def request_user_data
    user_data = connection.get("/api/v1/me")
    JSON.parse(user_data.body, symbolize_names: true)
  end

  def subreddits
    response = connection.get("/subreddits/mine/subscriber?limit=10")
    subreddits = JSON.parse(response.body, symbolize_names: true)
    subreddits[:data][:children]
  end

  private

    def connection
      oauth_connection = Faraday.new("https://oauth.reddit.com")
      oauth_connection.authorization(:bearer, @token)
      oauth_connection
    end
end
