Rails.application.routes.draw do
  post "/login", to: "auth#login"
  get "/auth", to: "auth#persist"
  resources :users, only: [:show, :create, :update, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
