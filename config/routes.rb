Rails.application.routes.draw do

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
end
