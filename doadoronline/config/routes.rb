Rails.application.routes.draw do

  devise_for :users
  resources :posts
  resources :orders
  resources :contacts
  
  # get 'posts' => 'posts#index'
  # post 'posts' => 'posts#create'
  # get 'post/:id' => 'post#show'
  # patch 'post/:id' => 'posts#update'
  # delete 'post/:id' => 'posts#destroy'
  # get 'post/new' => 'posts#new'
  # get 'post/edit' => 'posts#edit'

  root to: "home#index"
end
