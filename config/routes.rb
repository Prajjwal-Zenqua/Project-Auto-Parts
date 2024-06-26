Rails.application.routes.draw do
  get 'sellers/show'
  devise_for :users
  
  # , controllers: {
  #   registrations: 'users/registrations'
  # }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  root to: "home#index" 
  resources :products

  get '/contact', to: 'home#contact'
  get '/index', to: 'home#index'
  
  get '/seller', to: 'sellers#show'
  get '/addproduct', to: 'products#new'
  get '/buyproduct', to: 'products#show'
  
  # get 'about', to: 'pages#about'

  resources :sellers, only: [:show]
  # root to: "index#about"
  # Defines the root path route ("/")
  # root "posts#index"
  
end

