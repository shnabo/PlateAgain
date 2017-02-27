Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
get "users/index"
get "users/show"
get "users/edit"
get "users/new"

post "user/create"
post "user/update"
end
