Rails.application.routes.draw do
  get 'devices/index'
  get 'devices/show'
  get 'devices/new'
  get 'devices/create'
  get 'devices/edit'
  get 'devices/update'
  get 'devices/destroy'
  devise_for :users
  root to: 'pages#home'

  resources :users, only: [:show]

  resources :bookings, only: [:index, :new, :create]

  resources :devices

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

