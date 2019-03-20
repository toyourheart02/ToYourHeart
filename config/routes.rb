Rails.application.routes.draw do
  devise_for :users

  
  devise_for :admins
  get 'master/new'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'products' => 'products#index'
  root 'products#index'

  get 'admins/top'
  get 'admins/products' => 'admins#productindex'
  delete 'admins/products/:id' => 'admins#productdestroy', as: 'admins_destroy'


  get 'admins' => 'admins#index'
  get 'admins/:id' => 'admins#usershow', as: 'admins_usershow'
  patch 'admins/:id' => 'admins#userupdate', as: 'admins_userupdate'
  get 'admins/:id/edit' => 'admins#useredit', as: 'admins_useredit'
  delete 'admins/:id/destroy' => 'admins#userdestroy', as: 'admins_userdestroy'

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

  resources :users, only: [:show, :index, :edit, :update, :destroy]
  resources :carts, only: [:index, :destroy, :update]
  get 'carts/create' => 'carts#create', as: 'carts_create'


  resources :favorites, only: [:index, :destroy]
  get 'favrites/create' => 'favorites#create', as: 'favorites_create'


  resources :orders, only: [:new, :create, :index, :destroy,]
  resources :destinations, only: [:create, :destroy,]

  # resources :order_products, only: [:create, :destroy,]


end


