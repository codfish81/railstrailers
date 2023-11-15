Rails.application.routes.draw do
  devise_for :users
  resources :trailers
  get 'home/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  get 'home/contact'

  # Defines the root path route ("/")
   root "home#index"
end
