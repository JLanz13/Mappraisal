Rails.application.routes.draw do
  
  resources :movie_with_reviews
  resources :reviews
  resources :movies, only: [:index, :show, :create, :update, :destroy]
  resources :users, only: [:create, :update, :destroy]

  # Routing logic: fallback requests for React Router.
  # Leave this here to help deploy your app later!
  get "*path", to: "fallback#index", constraints: ->(req) { !req.xhr? && req.format.html? }
end
