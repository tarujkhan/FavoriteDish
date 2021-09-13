Rails.application.routes.draw do
  # root 'users#home'
  # get '/welcome' => 'welcome#home'
  get '/welcome/home', to: 'welcome#home'
  resources :dishes
  resources :cuisines
  resources :foodlovers
  resources :users
  # resources :sessions
  get 'auth/github/callback' => 'sessions#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
