class RedditServices

  def initialize(token)
    @token = token
  end

  def request_user_data
    user_data = connection.get("/api/v1/me")
    JSON.parse(user_data.body, symbolize_names: true)
  end

  private

    def connection
      oauth_connection = Faraday.new("https://oauth.reddit.com")
      oauth_connection.authorization(:bearer, @token)
      oauth_connection
    end
end
