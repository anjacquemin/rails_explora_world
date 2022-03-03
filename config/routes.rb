Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get "/dashboard", to: "pages#dashboard", as: "dashboard"
  get "/dashboard/:id", to: "pages#dashboard_booking", as: "dashboard_booking"


  resources :offers, only: [:index, :show]

  resources :slots do
    resources :rentals, only: [:create]
    resources :messages, only: [:create]
  end

  resources :rentals, only: [:create]

  resources :slots, only: [:show]
end
