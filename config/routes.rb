Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  get 'card/new'
  get 'card/show'
  get 'users/show'
  get 'users/logout'
  
  root to: 'tops#index'
  resources :tops
  resources :users 
  resources :purchases
  resources :card, only: [:new, :show] do
    collection do
      post 'show', to: 'card#show'
      post 'pay', to: 'card#pay'
      post 'delete', to: 'card#delete'
    end
  end
  # match '/tops(.:format)' => 'tops#top_create', via: [ :post ]
end
