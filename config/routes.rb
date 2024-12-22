Rails.application.routes.draw do
  get "users/show"
  devise_for :users
  root "home#index"  # Root route for home#index

  # Routes for SQL Injection and XSS search
  get "/home/search_sql_injection", to: "home#search_sql_injection", as: "home_search_sql_injection"
  get "/home/search_xss", to: "home#search_xss", as: "home_search_xss"

# config/routes.rb
resources :users, only: [ :show ]

  # Define routes for Bookings
  resources :bookings
end
