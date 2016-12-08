class SessionsController < ApplicationController

  def create
    if session[:reddit_state] = params[:state]

      tokens    = RedditOauthService.request_tokens(params[:code])
      user_data = RedditUser.user_data(tokens[:token])
      user      = User.find_or_create_user(user_data, tokens)

      session[:user_id] = user.id

      redirect_to dashboard_path
    else
      render file: 'public/404', layout: false
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path
  end
end
