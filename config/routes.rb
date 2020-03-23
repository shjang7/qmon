Rails.application.routes.draw do
  namespace :customers do
    get 'profiles/show'
  end
  devise_for :customers
  devise_for :merchandisers
  resources :products
  resources :purchases
  resources :orders
  resources :reviews, only: %i[show index edit create update]
  scope '/product_items/:product_item_id', :as => 'product_item' do
    resources :reviews, only: %i[new delete]
  end
  get '/static_pages/signup'
  get '/purchases/:id/complete', to: 'purchases#complete', as: 'complete_purchase'

  root 'products#index'
end
