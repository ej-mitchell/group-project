class BooksController < ApplicationController
  def index
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    user = current_user
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = 'Book was successfully added.'
      redirect_to @book
    else
      render action: 'new'
    end
  end

  def book_params
    params.require(:book).permit(:title, :author, :page_number, :summary, :cover_url, :user_id)
  end

end
