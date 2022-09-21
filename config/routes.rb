Rails.application.routes.draw do
  devise_for :users
  root to: 'groups#index'
  
  get 'groups/index', to: 'groups#index'
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  resources :users  
    resources :groups do
      resources :operations 
    end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
