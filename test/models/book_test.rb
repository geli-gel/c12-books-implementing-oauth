require "test_helper"

describe Book do

  describe "validations" do

    # Dee's tip: Make a variable in a before or let block that is always a valid book
    before do
      existing_author = Author.new
      @book = Book.new(title: "Valid, Present Title", author: existing_author)
    end
    
    it "can be valid" do
      is_valid = @book.valid?

      assert( is_valid )
    end

    it "is invalid if there is no title" do
      @book.title = ""

      is_valid = @book.valid?

      refute( is_valid )
    end

  end

end
