Rails.application.routes.draw do
  root to: "dashboard#index"
  get "/auth/:provider/callback", to: "sessions#create"
  get "/signout", to: "sessions#destroy", as: :signout
  resources :users, only: [:new, :create]
end
