Rails.application.routes.draw do
  get '/', to: 'sessions#home'
  get "/signup", to: "users#new"
  post "/signup", to: "users#new"
  get "login", to: "sessions#login"
  post "login", to: "sessions#login"
  delete "logout", to: "sessions#destroy"
  # get 'auth/github/callback', to: "sessions#create"
  get '/auth/github/callback', to: "sessions#create"
  # get '/', to: 'welcome#home'
  # get 'sessions/omniauth', :as => 'omniauth'
  # get 'sessions/:provider/callback', to: 'sessions#create'
  # get '/welcome/home', to: 'welcome#home'
    resources :users do 
    resources :dishes
    resources :cuisines
  end
  
  end

  # resources :sessions
  # get 'auth/github/callback' => 'sessions#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

