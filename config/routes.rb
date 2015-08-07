Rails.application.routes.draw do

  root 'items#index'
  resources :sessions, only:[:new, :create, :destroy]
  resources :users, :items, :bids

  resources :users do
    resources :items
  end

  resources :items do
    resources :bids
  end

end
