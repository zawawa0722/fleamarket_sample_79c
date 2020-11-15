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

  resources :products, except: :show do
    resources :purchase do
      member do
        get "index"
        post "create"
      end
    end
  end

  resources :purchase do
    collection do
      get 'complete'
    end

    member do
      post 'products'
    end
  end

  resources :card, only: [:new, :create, :destory, :show] do
    collection do
      delete 'destroy'
      post 'new'
      get 'complete'
    end
  end

  resources :users, only: :show
  resources :detail
  resources :comments
  resources :products, only: :create
  resources :complete, only: [:index]
  
  get 'glances/index'
  get 'detail/index'
  get 'comments/index'
  get 'complete/index'
  post 'card/new'
  get 'card/new'
  get 'card/show'
  get 'products/new'
  get 'products/create'
end
