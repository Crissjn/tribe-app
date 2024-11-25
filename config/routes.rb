Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get "/dashboard", to: "pages#dashboard"
  # Health status route for uptime monitoring
  get "up" => "rails/health#show", as: :rails_health_check

  # Experiences routes
  resources :experiences, only: [:index, :show, :new, :create] do
    member do
      get 'review_location' # Custom route to review the location and group activity
    end

    # Nested bookings routes under experiences
    resources :bookings, only: [:create]
  end

  # Bookings routes
  resources :bookings, only: [:index] do
    member do
      get 'confirmation' # Route for the booking confirmation page
      get 'chat', to: 'chats#index' # Show the chat interface for group members
    end
  end

  # Chats routes
  resources :chats, only: [] do
    resources :messages, only: [:create]
  end

  # Users routes
  resources :users, only: [:new, :create]
end
