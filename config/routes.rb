Rails.application.routes.draw do
  
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end
  root "front#index"

  resources :front do
    member do
      get 'products'
    end
  end
  resources :products, except: :show
  resources :purchase, only: [:index, :new, :edit, :create, :update, :purchase]
  resources :users, only: :show
  resources :glances
  resources :detail
  resources :comments
  resources :complete, only: [:index]
  resources :card, only: [:new, :create, :destory, :show]
  get 'glances/index'
  get 'detail/index'
  get 'comments/index'
  get 'complete/index'
  post 'card/new'
  get 'card/new'
  get 'card/show'
  get 'products/new'


end

