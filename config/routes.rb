Rails.application.routes.draw do
  post "/login", to: "auth#login"
  get "/auth", to: "auth#persist"
  resources :users, only: [:index, :show, :create, :update, :destroy]
  resources :products, only: [:index, :show]
  resources :carts, only: [:index, :show, :create, :update, :destroy]
  resources :reviews, only: [:index, :show, :create, :update]
  resources :orders, only: [:index, :show, :create]
  resources :charges, only: [:create]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
