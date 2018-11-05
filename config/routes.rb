Rails.application.routes.draw do
  # resources :users, except: [:index] do
  #   resources :bookings, only: [:index, :new, :create]
  #   resources :devices
  # end

  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
