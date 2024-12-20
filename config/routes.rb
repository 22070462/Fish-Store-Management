require 'sidekiq/web' # Ensure this is explicitly required

Rails.application.routes.draw do
  # Admin Panel
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  # Devise routes for user authentication
  devise_for :users

  # Mount Sidekiq Web UI for admins only
  authenticate :user, ->(u) { u.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end

  # Routes for Products (CRUD actions)
  resources :products, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    # Nested route for creating sales associated with a specific product
    resources :sales, only: [:create]
  end

  # Routes for Sales (listing sales)
  resources :sales, only: [:index, :create, :new, :edit, :update]

  # Fish resource (if you need it for later purposes, though you're not selling fish)
  resources :fish, only: [:index, :new, :create, :show, :edit, :update, :destroy]

  # Routes for Customers
  resources :customers do
    # Nested transactions routes under customers
    resources :transactions, only: [:index]
  end

  # Set the root path to home#index
  root to: 'home#index'
end
