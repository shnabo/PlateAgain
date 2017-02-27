Rails.application.routes.draw do
  # static pages
  root 'pages#home'
  get 'about', to: 'pages#about'
  get 'about_providers', to: 'pages#about_providers'
  get 'about_acceptors', to: 'pages#about_acceptors'

  resources :listings
end
