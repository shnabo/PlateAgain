Rails.application.routes.draw do

  # static pages
  root 'pages#home'

  get 'about', to: 'pages#about'
  get 'about_providers', to: 'pages#about_providers'
  get 'about_acceptors', to: 'pages#about_acceptors'

  get 'providers', to: 'users#providers'
  get 'acceptors', to: 'users#acceptors'
  get 'dashboard', to: 'users#dashboard', as: 'dashboard'

  resources :listings, only: [:index, :show]
  resources :users do
    resources :listings, except: :show
  end

  resources :sessions, only: [:new, :create, :destroy]
  get 'login', to: 'sessions#new', as: 'login'
  delete 'logout', to: 'sessions#destroy', as: 'logout'


end
