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


  resources :tops do
    collection do
      get 'category_children' 
      get 'category_grandchildren'
    end
    resources :comments, only: :create
  end
  resources :categories,only: :index
  resources :users, only: :new

  resources :purchases

  resources :cards, only: [:new, :show, :destroy] do
    collection do
      post 'pay', to: 'cards#pay'
    end
  end

  resources :products do
    resources :purchases, only: [:index] do
      collection do
        get 'done', to: 'purchases#done'
        post 'pay', to: 'purchases#pay'
      end
    end
  end

end
