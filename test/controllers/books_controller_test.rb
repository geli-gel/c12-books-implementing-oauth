require "test_helper"

describe BooksController do
  
  describe "index action" do

    it "gives back a successful response" do

      # Arrange
      # ... Nothing right now!

      # Act
      # Send a specific request... a GET request to the path "/books"
      get "/books"
      # get books_path

      # Assert
      # The response was OK!
      must_respond_with :success
      # must_respond_with 200
      # must_respond_with :redirect
      # must_respond_with :missing
      # must_respond_with :error

    end

    it "gives back a 404 if there are no books available" do

      # Arrange
      # Insert some code here that destroys all of the books in the database...

      # Act
      get "/books"

      # Assert
      # must_respond_with :missing
    end

  end

  describe 'show action' do

    it 'responds with a success when id given exists' do
      valid_book = Book.create(title: "Valid Book")
      
      get "/books/#{valid_book.id}"

      must_respond_with :success

    end

    it 'responds with a not_found when id given does not exist' do
      get '/books/500'

      must_respond_with :not_found
    end



  end



end
