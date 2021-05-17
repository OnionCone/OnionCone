Rails.application.routes.draw do
  devise_for :admins
  namespace :public do
    devise_for :customers, controllers: {
      sessions: 'public/customers/sessions',
      registrations: 'public/customers/registrations',
      passwords: 'public/customers/passwords'
    }
    resources :items, only: [:index, :show]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
