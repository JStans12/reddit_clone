class RedditOauthService

  def self.request_tokens(code)
    connection = Faraday.new("https://www.reddit.com")
    connection.basic_auth(ENV['reddit_client_id'], ENV['reddit_client_secret'])
    response = connection.post("/api/v1/access_token",
                                grant_type: "authorization_code",
                                code: code,
                                redirect_uri: "http://localhost:3000/auth/reddit/callback")

    response = JSON.parse(response.body)

    token = response["access_token"]
    refresh_token = response["refresh_token"]
    { token: token, refresh_token: refresh_token }
  end
end
