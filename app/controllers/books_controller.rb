class BooksController < ApplicationController
  def index
     
    @book = Book.search(params[:search])
    redirect_to :controller => 'api/v1/books', :action => 'index', :search => params[:search]
  end

  def show
    @book = Book.find(params[:id])
    @reviews = @book.reviews
    @new_review = Review.new
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
    params.require(:book).permit(:title, :author, :page_number, :summary, :cover_url, :user_id, :search, :field)
  end

end
