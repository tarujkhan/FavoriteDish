Rails.application.routes.draw do
  resources :dishes
  resources :cuisines
  resources :foodlovers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
