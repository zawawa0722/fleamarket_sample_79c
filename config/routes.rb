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
  resources :purchase, only: [:index, :new, :edit, :create, :update]
  resources :glances
  resources :detail
  get 'items/index'
  get 'glances/index'
  get 'detail/index'
  get 'purchase/index'
end

