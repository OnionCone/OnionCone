Rails.application.routes.draw do
  devise_for :admins
  namespace :public do
    devise_for :customers, controllers: {
      sessions: 'public/customers/sessions',
      registrations: 'public/customers/registrations',
      passwords: 'public/customers/passwords'
    }
    resources :items, only: [:index, :show]
    resources :cart_items, only: [:index, :update, :destroy, :create]
    delete 'cart_items' => 'cart_items#destroy_all', as: 'cart_item_all'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
