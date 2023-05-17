Rails.application.routes.draw do
  resources :users
  resources :properties
  resources :subs_mpesas
  resources :buyers
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  #buyers
  post 'userlogin', to: 'users#create'
  # post 'buyersignup', to: 'buyers#create'

  # mpesa
  post 'stkpush', to: 'subs_mpesas#stkpush'
  get 'stkpush', to: 'subs_mpesas#stkpush'
 
end
