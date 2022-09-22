Rails.application.routes.draw do
  devise_for :users
  unauthenticated :users do
    root "groups#index"
  end

  authenticated :users do
    #get "/home", to: "groups#index", as: "home"
    #root 'groups#index', as: ''
  end
  
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  resources :users
  resources :groups, only: %i[index new create destroy ] do
    resources :operations, only: %i[index new create]
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
