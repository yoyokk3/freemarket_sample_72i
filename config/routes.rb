Rails.application.routes.draw do
  get 'users/show'
  get 'users/logout'
  devise_for :users
  root to: 'tops#index'
  resources :tops
end
