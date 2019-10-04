Rails.application.routes.draw do

  root to: "books#index"

  # The syntax for generating the seven conventional RESTful routes for a given controller are:
  # resources _a symbol of the name of the controller_
  resources :books
end
