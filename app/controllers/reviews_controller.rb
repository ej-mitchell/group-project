class ReviewsController < ApplicationController
  def new
    @review = Review.new
    @book = Book.find(params[:book_id])
  end

  def create
    @review = Review.new(review_params)
    @book = Book.find(params[:book_id])

    if @review.save
      redirect_to book_path(@review.book_id), notice: "Review was added successfully!"
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(
    :rating,
    :text_body
      ).merge(book: Book.find(params[:book_id]),
      user_id: current_user.id)
  end
end
