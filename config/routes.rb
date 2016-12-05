Rails.application.routes.draw do
  root 'dashboard#index'

  get 'auth/reddit/callback', to: 'sessions#create'
end
