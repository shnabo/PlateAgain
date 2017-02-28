Rails.application.routes.draw do

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  patch '/logout', to: 'sessions#destroy'


  # static pages
  root 'pages#home'
  get 'about', to: 'pages#about'
  get 'about_providers', to: 'pages#about_providers'
  get 'about_acceptors', to: 'pages#about_acceptors'


  get 'providers', to: 'users#providers'
  get 'acceptors', to: 'users#acceptors'
  get '/users/:id/dashboard', to: 'users#dashboard', as: 'dashboard'

  resources :users do
    resources :listings
  end

  resources :sessions, only: [:new, :create, :destroy]

end
