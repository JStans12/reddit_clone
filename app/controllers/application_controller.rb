class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_reddit_state
  helper_method :current_user

  def set_reddit_state
    @reddit_state = (rand(9000) + 1000).to_s
    session[:reddit_state] = @reddit_state
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
