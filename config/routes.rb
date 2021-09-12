Rails.application.routes.draw do
  resources :dishes
  resources :cuisines
  resources :foodlovers
  get 'auth/github/callback' => 'sessions#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
