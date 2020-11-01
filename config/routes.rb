Rails.application.routes.draw do
  
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end
  root "front#index"
  resources :items
  resources :purchase, only: [:index, :new, :edit, :create, :update, :purchase]
  resources :users, only: :show
  resources :glances
  resources :detail
  resources :complete
  resources :card
  get 'items/index'
  get 'glances/index'
  get 'detail/index'
  get 'complete/index'
  post 'card/new'
  get 'card/new'
  get 'card/show'
end

