Rails.application.routes.draw do

  root 'home#index'
  get '/dashboard', to: "dashboard#index"
  get '/subreddit/:subreddit', to: "subreddits#show"

  get '/logout',              to: 'sessions#destroy'
  get 'auth/reddit/callback', to: 'sessions#create'
end
