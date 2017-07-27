class BooksController < ApplicationController
  before_action :authorize_user, only: [:delete]
  before_action :authenticate_user, only: [:new, :create]

  def index
    @book = Book.search(params[:search])
    if @book
      redirect_to :controller => 'api/v1/books', :action => 'index', :search => params[:search]
    end
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

  def destroy
    @book = Book.find(params[:id])

    if @book.destroy
      flash[:notice] = 'Book has been burned.'
      redirect_to books_path
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :author, :page_number, :summary, :cover_url, :user_id, :search, :field)
  end

  def authorize_user
    if !current_user.admin?
      raise ActionController::RoutingError.new("Not Found")
    end
  end

  def authenticate_user
    if !user_signed_in?
      flash[:notice] = 'You must sign in or sign up.'
      redirect_to new_user_session_path
    end
  end
end
