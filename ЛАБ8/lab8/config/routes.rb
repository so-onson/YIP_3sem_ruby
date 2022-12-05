Rails.application.routes.draw do
  resources :users
  get "example/input"
  post 'example/show'
  get 'example/input'
  root "session#login"
  get 'session/authorize'
  get 'session/logout'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
