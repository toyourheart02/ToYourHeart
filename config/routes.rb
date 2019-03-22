Rails.application.routes.draw do

  devise_for :admins
  get 'master/new'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'products' => 'products#index'
  root 'products#index'

  get 'admins/top'
  get 'admins' => 'admins#index'
  get 'admins/:id' => 'admins#usershow', as: 'admins_usershow'
  patch 'admins/:id' => 'admins#userupdate', as: 'admins_userupdate'
  get 'admins/:id/edit' => 'admins#useredit', as: 'admins_useredit'

  post 'artists' => 'artists#create'
  get 'artist' => 'master#new'

  post 'genres' => 'genres#create'
  get 'genre' => 'master#new'

  post 'labels' => 'labels#create'
  get 'label' => 'master#new'

  post 'scenes' => 'scenes#create'
  get 'scene' => 'master#new'

  get 'products/new' => 'products#new'
  post 'products' => 'products#create'

  get 'products/:id/edit' => 'products#edit', as: 'product'
  # post 'products' => 'products#update'
  patch '/products/:id' => 'products#update', as: 'update_product'
  get 'products/:id' => 'products#show', as: 'products_show'

  post 'products/:id/reviews' => 'reviews#create', as: 'reviews'
  resources :reviews, only: [:destroy]

  post 'musics' => 'musics#create'
  get 'music' => 'master#new'


  post 'products/sort' => 'products#sort', as: 'products_sort'

  resources :users, only: [:show, :index, :edit, :update]
  resources :carts, only: [:index, :destroy, :update]
  get 'carts/create' => 'carts#create', as: 'carts_create'

  resources :favorites, only: [:index, :destroy]
  get 'favrites/create' => 'favorites#create', as: 'favorites_create'
  resources :product_musics, only: [:edit, :destroy]
  get 'products/:id/product_musics/new' => 'product_musics#new', as: 'new_product_music'
  post 'products/:id/product_musics' => 'product_musics#create', as: 'product_musics'

end


