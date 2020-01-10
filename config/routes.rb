Rails.application.routes.draw do
  post "/login", to: "auth#login"
  get "/auth", to: "auth#persist"
  resources :users, only: [:index, :show, :create, :update, :destroy]
  resources :products, only: [:index, :show]
  resources :orders, only: [:index, :show, :create, :update, :destroy]
  resources :reviews, only: [:index, :create]
  resources :charges, only: [:new, :create]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
