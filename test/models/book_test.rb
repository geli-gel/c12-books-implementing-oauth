require "test_helper"

describe Book do

  describe "validations" do

    # Dee's tip: Make a variable in a before or let block that is always a valid book
    
    it "can be valid" do
      is_valid = books(:valid_book_without_release_date).valid?

      assert( is_valid )
    end

    it "is invalid if there is no title" do
      book = books(:invalid_book_without_title)

      is_valid = book.valid?

      refute( is_valid )
    end

    # Pseudocode for presence validation test ... IF IT HAD ONE
    # it is invalid if the title is not unique

      # Arrange
      # we need an author to make at least one valid book...
      # We need to make a book!
      # We need to save this first book...
      # WE NEED TO MAKE ANOTHER BOOK! ... which has the same title as the first book

      # Act
      # trigger a validation check

      # Assert
      # it is not valid

  end

  describe "relationships" do

    it 'can set the author through "author"' do
      # Arrange
      # There is an author
      # There is a book
      author = authors(:metz)
      book = Book.new(title: "test book")

      # Act
      # Set the book's author using .author
      book.author = author

      # Assert
      # The book's author is the author we're expecting
      expect( book.author_id ).must_equal author.id
    end

    it 'can set the author through "author_id"' do
      # Arrange
      # There is an author
      # There is a book
      author = authors(:metz)
      book = Book.new(title: "test book")

      # Act
      # Set the book's author using .author
      book.author_id = author.id

      # Assert
      # The book's author is the author we're expecting
      expect( book.author ).must_equal author
    end

  end

end
