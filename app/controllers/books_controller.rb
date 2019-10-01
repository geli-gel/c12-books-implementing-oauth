
BOOKS = [
  { title: "Hidden Figures", author: "Margot Lee Shetterly"},
  { title: "Practical Object-Oriented Design in Ruby", author: "Sandi Metz"},
  { title: "Kindred", author: "Octavia E. Butler"}
]

class BooksController < ApplicationController

  def index
    @books = BOOKS
    # @name = {first_name: "Dee"}

    # By default, our controllers will look for an appropriate view (aka something in views/books/index.html.erb)
    # If I WANTED to, I can tell the controller to give back a certain format-type and status code (like below:)
    # return head :not_found

    # By default, our controllers will look for a view to send back, along with assuming it is a status code of 200
    # If we need to specify otherwise, we will do so in the controller
  end

  def show
    # If we need to access something from the route... (like a route param), we will access it from the params hash-like object
    book_id = params[:id].to_i
    @book = BOOKS[book_id]
    if @book.nil?
      head :not_found
      return
    end
  end

end
