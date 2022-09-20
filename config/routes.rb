Rails.application.routes.draw do
  devise_for :users
  root to: "user#index"
  resources :group_operations
  resources :groups
  resources :operations
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
