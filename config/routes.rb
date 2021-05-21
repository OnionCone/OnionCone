Rails.application.routes.draw do
  devise_for :admins

  namespace :admin do
      root 'orders#index'
      resources :items,only: [:index,:new,:create,:show,:edit,:update]
      resources :genres,only: [:index,:create,:edit,:update]
      resources :customers,only: [:index,:show,:edit,:update]
      resources :orders,only: [:show,:update]
  end

  namespace :public do
    resources :items, only: [:index, :show]
    resources :cart_items, only: [:index, :update, :destroy, :create]
    delete 'cart_items' => 'cart_items#destroy_all', as: 'cart_item_all'
    resources :addresses, only: [:index, :update, :destroy, :create, :edit]
  end
  devise_for :customers

  scope module: 'public' do
    root to: 'homes#top'
    get '/about', to: 'homes#about'
    get 'customers/my_page', to: 'customers#show'
    get 'customers/unsubscribe', to: 'customers#unsubscribe'
    patch 'customers/withdrawal', to: 'customers#withdrawal', as: 'withdrawal'
    resources :customers, only: [:edit, :update]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :admin do
    resources :items, only: [:new, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
  end

end

