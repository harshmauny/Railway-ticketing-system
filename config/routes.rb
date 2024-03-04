Rails.application.routes.draw do
  root 'home#index'
  get '/reviews/filter', to: 'reviews#filter'
  get '/trains/filter', to: 'trains#filter'
  get '/trains/search_train', to: 'trains#search_train', as: 'search_train'
  get 'signup', to: "passengers#new", as: 'signup'
  get 'login', to: "sessions#new", as: 'login'
  get 'logout', to: "sessions#destroy", as: 'logout'
  resources :sessions, only: [:new, :create, :destroy]
  resources :admins
  resources :trains
  resources :tickets
  resources :reviews
  resources :passengers
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
end
