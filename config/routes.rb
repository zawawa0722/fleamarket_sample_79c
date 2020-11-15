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
  get 'products/create'

  resources :products do
    resources :comments,  only: [:create, :destroy]
    resources :favorites, only: [:create, :destroy]
    collection do
      get 'category/get_category_children', to: 'products#get_category_children', defaults: { format: 'json' }
      get 'category/get_category_grandchildren', to: 'products#get_category_grandchildren', defaults: { format: 'json' }
      get 'search'
      get 'post_done'
      get 'delete_done'
      get 'detail_search'
      get 'update_done'
    end
  end

end


