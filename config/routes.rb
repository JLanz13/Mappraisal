Rails.application.routes.draw do
  
  resources :movie_with_reviews
  resources :reviews
  resources :movies
  resources :users

  get '/me', to: "users#show"
  # Routing logic: fallback requests for React Router.
  # Leave this here to help deploy your app later!
  get "*path", to: "fallback#index", constraints: ->(req) { !req.xhr? && req.format.html? }
end
