Rails.application.routes.draw do
  devise_for :customers
  devise_for :merchandisers
  resources :products
  get 'static_pages/signup'

  root 'products#index'
end
