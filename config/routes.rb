Rails.application.routes.draw do
  resources :properties
  resources :subs_mpesas
  resources :buyers
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  post 'stkpush', to: 'subs_mpesas#stkpush'
  get 'stkpush', to: 'subs_mpesas#stkpush'
  post 'buyerlogin', to: 'buyers#login'
end
