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
  resources :detail do
    resources :comments
  end
  resources :complete, only: [:index]
  resources :card, only: [:new, :create, :destory, :show, :index]
  get 'glances/index'
  get 'detail/index'
  get 'products/new'
  post 'card/new'

end

