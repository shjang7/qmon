Rails.application.routes.draw do
  namespace :customers do
    get 'profiles/show'
  end
  devise_for :customers
  devise_for :merchandisers
  resources :products
  resources :purchases
  resources :orders
  resources :reviews
  get '/static_pages/signup'
  get '/purchases/:id/complete', to: 'purchases#complete', as: 'complete_purchase'

  root 'products#index'
end
