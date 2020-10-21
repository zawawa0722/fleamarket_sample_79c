Rails.application.routes.draw do
  devise_for :users
  root "front#index"
  resources :items
  resources :glances
  resources :detail
  get 'items/index'
  get 'glances/index'
  get 'detail/index'
end

