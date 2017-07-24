class ReviewsController < ApplicationController
  before_action :authorize_user, only: [:index, :destroy]

  def index
    @reviews = Review.all
  end

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

  def destroy
    @review = Review.find(params[:id])

    if @review.destroy
      flash[:notice] = 'Review has been incinerated.'
      redirect_to reviews_path
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

  def authorize_user
    if !current_user.admin?
      raise ActionController::RoutingError.new("Not Found")
    end
  end
end
