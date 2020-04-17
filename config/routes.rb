Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  get 'card/new'
  get 'card/show'
  get 'users/show'
  get 'users/logout'
  
  root to: 'tops#index'
  
  resources :tops
  resources :users, only: :new
  resources :purchases

  resources :card, only: [:new, :show] do
    collection do
      post 'show', to: 'card#show'
      post 'pay', to: 'card#pay'
      post 'delete', to: 'card#delete'
    end
  end
end
