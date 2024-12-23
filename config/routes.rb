Rails.application.routes.draw do
  devise_for :users
  root to: "experiences#index"
  get "/dashboard", to: "pages#dashboard"
  # Health status route for uptime monitoring
  get "up" => "rails/health#show", as: :rails_health_check

  # Experiences routes
  resources :experiences do
    member do
      get 'review_location' # Custom route to review the location and group activity
    end

    # Nested bookings routes under experiences
    resources :bookings, only: [:create, :new, :index]
  end

  # Bookings routes
  resources :bookings, only: [:show] do
    resources :messages, only: :create
    member do
      get 'confirmation' # Route for the booking confirmation page
    end
  end

  # Chats routes
  resources :chats, only: [] do
    resources :messages, only: [:create]
  end

  # Users routes
  resources :users, only: [:new, :create]
end
