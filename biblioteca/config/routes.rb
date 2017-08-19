Rails.application.routes.draw do
  get "bookings" => 'bookings#index'
  post 'bookings' => 'bookings#create'
  get 'bookings/new', as: :new_booking
  get 'bookings/edit', as: :edit_booking

  devise_for :users
  get "authors" => 'authors#index'
  post 'authors' => 'authors#create'
  get 'author/new' => 'authors#new', as: :new_author
  get "author/:id/edit" => 'authors#edit', as: :edit_author
  get "author/:id" => 'authors#show', as: :author
  patch "author/:id" => "authors#update"
  delete "author/:id" => "authors#destroy"

  get 'books' => 'books#index'
  post 'books' => 'books#create'
  get 'book/new' => 'books#new', as: :new_book
  get 'book/:id/edit' => 'books#edit', as: :edit_book
  get 'book/:id' => 'books#show', as: :book
  patch 'book/:id' => 'books#update'
  delete 'book/:id' => 'books#destroy'

  root to: "home#index"



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
