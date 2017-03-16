Rails.application.routes.draw do

  # static pages
  root 'pages#home'

  get 'about', to: 'pages#about'
  get 'about_providers', to: 'pages#about_providers'
  get 'about_acceptors', to: 'pages#about_acceptors'

  get 'providers', to: 'users#providers'
  get 'acceptors', to: 'users#acceptors'
  get ':id/listings',  to: 'users#listings', as: 'my_listings'
  get 'dashboard', to: 'users#dashboard', as: 'dashboard'
#   get  '/users/:user_id/comments/:id/edit', to: 'comments#edit', as: 'edit_comment'
#  post '/users/:user_id/comments/:id/edit', to: 'comments#update', as: 'update_comment'

#  delete '/users/:user_id/comments/:id', to: 'comments#destroy', as: 'delete_comment'

  resources :listings

  resources :users do
    resources :comments
  end

  resources :conversations do
    resources :messages
  end



  resources :sessions, only: [:new, :create, :destroy]
  get 'login', to: 'sessions#new', as: 'login'
  delete 'logout', to: 'sessions#destroy', as: 'logout'


end
