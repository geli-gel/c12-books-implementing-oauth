class BooksController < ApplicationController

  def index
    @books = Book.all
    # @name = {first_name: "Dee"}

    # By default, our controllers will look for an appropriate view (aka something in views/books/index.html.erb)
    # If I WANTED to, I can tell the controller to give back a certain format-type and status code (like below:)
    # return head :not_found

    # By default, our controllers will look for a view to send back, along with assuming it is a status code of 200
    # If we need to specify otherwise, we will do so in the controller
  end

  def show
    book_id = params[:id].to_i
    # Both find and find_by will work... But Dee has a preference for find_by. Why?
    @book = Book.find_by(id: book_id)
    if @book.nil?
      head :not_found
      return
    end
  end

end
