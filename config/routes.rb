Rails.application.routes.draw do
  get 'welcome/index'
  get 'stores/new'
  get 'stores/create'
  get 'stores/show'
  get 'home/index'
  root 'home#index'
  devise_for :users, controllers: { registrations: 'registrations' }
  resources :stores, only: [:new, :create, :show] do
    resources :products, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
