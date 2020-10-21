Rails.application.routes.draw do
  devise_for :users
  root "front#index"
  resources :items
  get 'detail/index'
  resources :glances, only: :index
  get 'items/index'
  get 'glances/index'
  resources :purchase, only: [:index, :new, :edit, :create, :update]
  get 'purchase/index'
end

