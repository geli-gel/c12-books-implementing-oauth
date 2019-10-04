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

  def new
    # This new "empty" instance of the Book model is used in the view's form... When it's "empty", the form will be empty
    @book = Book.new
  end

  def create
    # Step 2: Create an action so that the form data actually gets processed by Rails (by the server) and creates that new book, and changes the database... Also, if there is an error in changing the database, we will handle it here.

    # First, we will access the form data from the new book form using params and its very specific data structure

    # Every time I call something like Book.new, Book.create, Book.update in the controller, I will replace the params with strong params
    @book = Book.new( book_params )

    if @book.save
      redirect_to book_path(@book.id)
    else
      render new_book_path
    end
  end

  def edit
    @book = Book.find_by(id: params[:id] )
  end

  def update
    @book = Book.find_by(id: params[:id] )

    # Instead of doing @book.title = ... assignment, and then @book.save, we will instead do "if @book.update( book_params )" to use strong params pattern. @book.update() will be false if the update was unsuccessful
    if @book.update( book_params )
      redirect_to book_path(@book.id)
    else
      render new_book_path
    end
  end

  def destroy
    # We will find the right book using the id found in params
    # Then, depending on if we find it...
    #   we will either destroy it, then we will redirect to root page
    #   or not! and we will redirect to index page

    the_correct_book = Book.find_by( id: params[:id] )

    # Because find_by will give back nil if the book is not found...

    if the_correct_book.nil?
      # Then the book was not found!
      redirect_to books_path
      return
    else
      # Then we did find it!
      the_correct_book.destroy
      redirect_to root_path
      return
    end
  end

  private

  # Every method defined under the word private is going to be a private method

  def book_params
    # The responsibility of this method is to return "strong params"
    # .require is used when we use form_with and a model, and therefore our expected form data has the "book" hash inside of it
    # .permit takes in a list of names of attributes to allow... (aka the new Book form has title, author, description)
    return params.require(:book).permit(:title, :author, :description)

    # Remember: If you ever update the database, model, and form, this will also need to be updated
  end

end
