Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  root to: 'tops#index'
  resources :tops
  resources :categories,only: :index
end
