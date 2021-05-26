Rails.application.routes.draw do
  get 'order_details/update'
 
 devise_for :admins, skip: :all
 devise_scope :admin do
  get 'admins/sign_in' => 'admins/sessions#new', as: :new_admin_session
  post 'admins/sign_in' => 'admins/sessions#create', as: :admin_session
  delete 'logout' => 'admins/sessions#destroy', as: :destroy_admin_session
end
 
   #devise_for :admins, controllers: {
  #sessions:      'admins/sessions',
  #passwords:     'admins/passwords',
  #registrations: 'admins/registrations'
#}
  namespace :admin do
      root 'homes#index'
      resources :items,only: [:index,:new,:create,:show,:edit,:update]
      resources :genres,only: [:index,:create,:edit,:update]
      resources :customers,only: [:index,:show,:edit,:update]
      resources :orders,only: [:show,:update]
      resources :order_details,only: [:update]
  end

  # namespace :public do
  #   resources :items, only: [:index, :show]
  #   resources :cart_items, only: [:index, :update, :destroy, :create]
  #   delete 'cart_items' => 'cart_items#destroy_all', as: 'cart_item_all'
  #   resources :addresses, only: [:index, :update, :destroy, :create, :edit]
  #   resources :orders, only: [:index, :show]
  # end

  devise_for :customers, controllers: {
  sessions:      'customers/sessions',
  passwords:     'customers/passwords',
  registrations: 'customers/registrations'
}

  scope module: 'public' do
    root to: 'homes#top'
    get '/about', to: 'homes#about'
    get 'customers/my_page', to: 'customers#show'
    get 'customers/unsubscribe', to: 'customers#unsubscribe'
    patch 'customers/withdrawal', to: 'customers#withdrawal', as: 'withdrawal'
    resources :customers, only: [:edit, :update]

    get '/orders/complete', to: 'orders#complete', as: 'complete'
    resources :orders, only: [:new, :create, :index, :show]
    post '/orders/confirm', to: 'orders#confirm', as: 'confirm'
    resources :items, only: [:index, :show]
    resources :cart_items, only: [:index, :update, :destroy, :create]
    delete 'cart_items' => 'cart_items#destroy_all', as: 'cart_item_all'
    resources :addresses, only: [:index, :update, :destroy, :create, :edit]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # namespace :admin do
  #   resources :items, only: [:new, :create, :edit, :update]
  #   resources :customers, only: [:index, :show, :edit, :update]
  # end
end

