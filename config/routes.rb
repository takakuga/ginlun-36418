Rails.application.routes.draw do
  get 'eats/index'
  devise_for :users
  root to: "eats#index"
  resources :eats
end
