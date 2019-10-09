class AuthorsController < ApplicationController

  def index
      @authors = Author.all
  end

  def show
    author_id = params[:id].to_i
    @author = Author.find_by(id: author_id)
    if @author.nil?
      head :not_found
      return
    end
  end

  def new
      @author = Author.new
  end

  def create
    @author = Author.new( author_params )
    if @author.save
      redirect_to author_path(@author.id)
    else
      render new_author_path
    end
  end

  def edit
    @author = Author.find_by(id: params[:id] )
  end

  def update
    @author = Author.find_by(id: params[:id] )
    if @author.update( author_params )
      redirect_to author_path(@author.id)
    else
      render new_author_path
    end
  end

  def destroy

    the_correct_author = Author.find_by( id: params[:id] )

    if the_correct_author.nil?
      redirect_to authors_path
      return
    else
      the_correct_author.destroy
      redirect_to root_path
      return
    end
  end

  private             

  def author_params
    return params.require(:author).permit(:name)
  end

end
