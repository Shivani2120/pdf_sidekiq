require 'sidekiq/web'
Rails.application.routes.draw do
  resources :posts do
    member do 
      get :download
    end
  end
  devise_for :users
  authenticate :user, ->(u) { u.admin? } do 
    mount Sidekiq::Web => '/sidekiq'
  end
  root 'pages#home'

  post "hello", to: "pages#hello"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
