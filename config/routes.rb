Rails.application.routes.draw do

  devise_for :admins
  get 'master/new'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'products' => 'products#index'
  root 'products#index'
  get 'admins/top'
  get 'admins' => 'admins#index'
  # resources :admins, only: [:index]
  get 'admins/:id' => 'admins#usershow', as: 'admins_usershow'
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




  post 'musics' => 'musics#create'
  get 'music' => 'master#new'


  post 'products/sort' => 'products#sort', as: 'products_sort'

  resources :users, only: [:show, :index, :edit, :update]



end
