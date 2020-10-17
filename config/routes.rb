Rails.application.routes.draw do
  devise_for :users
  root "front#index"
  resources :items
  get 'detail/index'
  resources :glances
  get 'items/index'
  get 'glances/index'
end

