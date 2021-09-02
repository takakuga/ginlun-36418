Rails.application.routes.draw do
  get 'eats/index'
  devise_for :users
  root to: "eats#index"
  resources :eats do
  resources :comments, only: :create
  end
  resources :users, only: :show
end
