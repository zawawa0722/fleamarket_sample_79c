Rails.application.routes.draw do
  devise_for :users
  # devise_for :users
  root 'front#index'
end

