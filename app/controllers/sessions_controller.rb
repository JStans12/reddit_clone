class SessionsController < ApplicationController
  def create
    if session[:reddit_state] = params[:state]

      tokens = RedditOauthService.request_tokens(params[:code])
      user_data = RedditMeService.request_user_data(tokens)
      user = User.find_or_create_user(user_data, tokens)

      session[:user_id] = user.id

      redirect_to root_path
    end
  end
end
