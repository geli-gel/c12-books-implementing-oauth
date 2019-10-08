require "test_helper"

describe Book do

  describe "validations" do

    # Dee's tip: Make a variable in a before or let block that is always a valid book
    
    it "can be valid" do
      # Arrange
      # Arranging all of the attributes of a new book so that they are valid

      # Act
      # Making a book, and then triggering validation check

      # Assert
      # our book.valid? IS true
      # maybe we will test that there are no errors
    end

    it "is invalid if there is no title" do
      # Arrange
      # Get the valid book, then INVALIDATE IT by re-assigning the title with an invalid value
      book.title = ""

      # Act
      # Trigger the validation check

      # Assert
      # our book.valid? is false
      # possibly check the structure of .errors


    end


  end

end
