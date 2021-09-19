Rails.application.routes.draw do
  get '/', to: 'welcome#home'
  # root 'users#home'
  # get '/welcome' => 'welcome#home'
  get 'auth/omniauth', :as => 'omniauth'
  get 'auth/:provider/callback', to: 'sessions#omniauth'
  get '/welcome/home', to: 'welcome#home'
  # resources :foodlovers
  # resources :cuisines do
  #   resources :dishes
  resources :users do 
    resources :dishes
    resources :cuisines
  end
  
  end

  # resources :sessions
  # get 'auth/github/callback' => 'sessions#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

