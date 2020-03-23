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
  get '/shopping_carts', to: 'purchases#index_cart'
  scope '/purchases/:id', :as => 'purchase' do
    get '/complete', to: 'purchases#complete', as: 'complete'
  end

  root 'products#index'
end
