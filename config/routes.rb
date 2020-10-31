Rails.application.routes.draw do
  
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end
  root "front#index"


  resources :products, except: :show

  resources :items
  resources :purchase, only: [:index, :new, :edit, :create, :update, :purchase]
  resources :glances
  resources :detail
  resources :complete, only: [:index]
  resources :card, only: [:new, :create, :destory, :show]
  get 'items/index'
  get 'glances/index'
  get 'detail/index'
  

end

