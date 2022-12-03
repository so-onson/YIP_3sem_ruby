Rails.application.routes.draw do
  resources :users
  root "example#input"
  post'example/show'
  get 'example/input'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
