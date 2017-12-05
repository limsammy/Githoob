Rails.application.routes.draw do
  root to: "dashboard#index"
  get "/auth/:provider/callback" => "sessions#create"
  get "/signout" => "sessions#destroy", :as => :signout
  resources :users, only: [:new, :create]
end
