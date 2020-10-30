Rails.application.routes.draw do
  devise_for :users
  root "front#index"

  get "products/index"
  resources :products, except: :show
end

