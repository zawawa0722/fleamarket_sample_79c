Rails.application.routes.draw do
  devise_for :users
  root "front#index"
  resources :items
  resources :glances
  get 'items/index'
  get 'glances/index'
end

