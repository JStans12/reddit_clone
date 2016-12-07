Rails.application.routes.draw do

  root 'dashboard#index'

  get '/logout',              to: 'sessions#destroy'
  get 'auth/reddit/callback', to: 'sessions#create'
end
