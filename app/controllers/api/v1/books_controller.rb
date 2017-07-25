class Api::V1::BooksController < ApplicationController
  def index
    if params[:search]
      @search = params[:search]
      @search_results = Book.where(['title ILIKE ?', "%#{params[:search]}%"])
    else
      render json: Book.all, adapter: :json
    end
  end

  def show
    @book = { book: Book.find(params[:id]) }
    @reviews = { reviews: Review.where(book_id: params[:id]).order(created_at: :desc) }
    book_reviews = @book.merge(@reviews)

    render json: book_reviews, adapter: :json

  end
end
