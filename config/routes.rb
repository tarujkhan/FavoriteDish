Rails.application.routes.draw do
  get '/', to: 'welcome#home'
  # root 'users#home'
  # get '/welcome' => 'welcome#home'
  get 'auth/:provider/callback', to: 'sessions#omniauth'
  get '/welcome/home', to: 'welcome#home'
  resources :foodlovers
  resources :dishes do
   resources :cuisines
  resources :users
  end

  # resources :sessions
  # get 'auth/github/callback' => 'sessions#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
end