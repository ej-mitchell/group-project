class BooksController < ApplicationController
  before_action :authorize_user, only: [:delete]
  # before_action :authenticate_user, only: [:new, :create]

  def index
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

  def delete
    @book = Book.find(params[:id])

    @book.destroy
    redirect_to books_path
  end

  def book_params
    params.require(:book).permit(:title, :author, :page_number, :summary, :cover_url, :user_id)
  end

  def authorize_user
    if !current_user.admin?
      raise ActionController::RoutingError.new("Not Found")
    end
  end


end
