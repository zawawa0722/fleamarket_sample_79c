Rails.application.routes.draw do
  devise_for :users
  root "front#index"
  resources :items
  get 'items/index'
  
end

