Rails.application.routes.draw do
  devise_for :users
  root to: 'users#index'
  resources :group_operations
  resources :groups
  get 'users/index', to: 'users#index'
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  resources :users
  resources :operations
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
