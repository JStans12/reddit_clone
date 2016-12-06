class SessionsController < ApplicationController
  def create
    if session[:reddit_state] = params[:state]

      connection = Faraday.new("https://www.reddit.com")
      connection.basic_auth(ENV['reddit_client_id'], ENV['reddit_client_secret'])
      response = connection.post("/api/v1/access_token",
                                  grant_type: "authorization_code",
                                  code: params[:code],
                                  redirect_uri: "http://localhost:3000/auth/reddit/callback")

      response = JSON.parse(response.body)

      token = response["access_token"]
      refresh_token = response["refresh_token"]

      oauth_connection = Faraday.new("https://oauth.reddit.com")
      oauth_connection.authorization(:bearer, token)
      auth = oauth_connection.get("/api/v1/me")

      auth = JSON.parse(auth.body)

      user = User.find_or_create_by(uid: auth["id"])
      user.username = auth["name"]
      user.token = token
      user.refresh_token
      user.save

      session[:user_id] = user.id

      redirect_to root_path
    end
  end
end
