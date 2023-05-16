Rails.application.routes.draw do
  resources :subs_mpesas
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  post 'stkpush', to: 'subs_mpesas#stkpush'
  get 'stkpush', to: 'subs_mpesas#stkpush'
end
