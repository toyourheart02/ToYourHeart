Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'products' => 'products#index'
  root 'products#index'

  get 'products/new' => 'products#new'
  post 'products' => 'products#create'



end
