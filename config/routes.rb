Rails.application.routes.draw do
  devise_for :users
  root "home#index"

  # Bookings routes
  resources :bookings

  post "sign out", to: "sessions#destroy"

  # Simple home page route
  get "home/index"
end
