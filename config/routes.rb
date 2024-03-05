Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Resources routes
  resources :resources

  # Bookmarks routes
  resources :bookmarks, only: [:create, :destroy]

  # Define bookmarks index route
  get '/bookmarks', to: 'bookmarks#index'
end
