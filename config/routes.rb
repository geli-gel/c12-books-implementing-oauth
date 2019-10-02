Rails.application.routes.draw do

  root :to => "books#index"

  # Routes that operate on the book collection
  get '/books', to: 'books#index', as: 'books'
  # Step 1: Create a view so that a user sees the New Book Form
  get '/books/new', to: 'books#new', as: 'new_book'
  # Step 2: Create an action so that the form data actually gets processed by Rails (by the server) and creates that new book, and changes the database
  post '/books', to: 'books#create'

  # Routes that operate on individual books
  get '/books/:id', to: 'books#show', as: 'book'
  get '/books/:id/edit', to: 'books#edit', as: 'edit_book'
  patch '/books/:id', to: 'books#update'
  delete '/books/:id', to: 'books#destroy'
end
