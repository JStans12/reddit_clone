class SessionsController < ApplicationController
  def create
    if session[:reddit_state] = params[:state]

      tokens = request_tokens(params[:code])
      user_data = request_user_data(tokens)
      user = find_or_create_user(user_data, tokens)

      session[:user_id] = user.id

      redirect_to root_path
    end
  end

  def request_tokens(code)
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

  def request_user_data(tokens)
    oauth_connection = Faraday.new("https://oauth.reddit.com")
    oauth_connection.authorization(:bearer, tokens[:token])
    user_data = oauth_connection.get("/api/v1/me")
    JSON.parse(user_data.body)
  end

  def find_or_create_user(user_data, tokens)
    user = User.find_or_create_by(uid: user_data["id"])
    user.username = user_data["name"]
    user.token = tokens[:token]
    user.refresh_token = tokens[:refresh_token]
    user.save
    user
  end
end
