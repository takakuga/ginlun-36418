Rails.application.routes.draw do
  get 'eats/index'
  devise_for :users
  root to: "eats#index"
  resources :eats do
    resources :goods, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  collection do
    get 'search'
  end
  end
  resources :users, only: :show
end
