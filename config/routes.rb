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
    devise_for :customers, controllers: {
      sessions: 'public/customers/sessions',
      registrations: 'public/customers/registrations',
      passwords: 'public/customers/passwords'
    }
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
