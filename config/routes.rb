Rails.application.routes.draw do
  get 'card/new'
  get 'card/show'
  get 'users/show'
  get 'users/logout'
  devise_for :users
  root to: 'tops#index'
  resources :tops
  resources :categories,only: :index
  resources :users
  resources :purchases
  resources :card, only: [:new, :show] do
    collection do
      post 'show', to: 'card#show'
      post 'pay', to: 'card#pay'
      post 'delete', to: 'card#delete'
    end
  end
end
