Rails.application.routes.draw do
  root 'welcome#home'
  get "/signup", to: "users#create"
  post "/signup", to: "users#create"
  get "login", to: "sessions#create"
  post "login" to: "sessions#create"
  delete "logout", to: "sessions#destroy"
  # get 'auth/github/callback', to: "sessions#create"
  get 'auth/github/callback', to: "sessions#omniauth"
  get '/', to: 'welcome#home'
  # get 'sessions/omniauth', :as => 'omniauth'
  # get 'sessions/:provider/callback', to: 'sessions#create'
  get '/welcome/home', to: 'welcome#home'
    resources :users do 
    resources :dishes
    resources :cuisines
  end
  
  end

  # resources :sessions
  # get 'auth/github/callback' => 'sessions#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

