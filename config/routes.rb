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
  collection do
    get 'sold'
  end
    member do
      get 'products'
    end
  end

  resources :card, only: [:new, :create, :show, :destroy]

  resources :users, only: :show

  resources :detail

  resources :comments

  resources :complete, only: [:index]
  
  resources :products do
    resources :purchases, only: [:index, :create]
    resources :comments,  only: [:create, :destroy]
    resources :favorites, only: [:create, :destroy]
    collection do
      get 'category/get_category_children', to: 'products#get_category_children', defaults: { format: 'json' }
      get 'category/get_category_grandchildren', to: 'products#get_category_grandchildren', defaults: { format: 'json' }
    end
  end
end


