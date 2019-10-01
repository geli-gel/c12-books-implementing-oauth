Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # When I want to redefine the value of the variable root_path (so it goes to a specific controller and action), I use this syntax:
  root :to => "books#index"

  get '/books', to: 'books#index'

  get '/books/:id', to: 'books#show'

end
