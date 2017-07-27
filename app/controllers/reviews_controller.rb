class ReviewsController < ApplicationController
  before_action :authorize_user, only: [:index, :destroy]
  before_action :authenticate_user, only: [:new, :create]

  def index
    @reviews = Review.all
  end

  def new
    @review = Review.new
    @book = Book.find(params[:book_id])
    @star_collection = Review::STARS
  end

  def create
    @review = Review.new(review_params)
    @book = Book.find(params[:book_id])

    if @review.save
      ReviewMailer.new_review(@review).deliver_now
      redirect_to book_path(@review.book_id), notice: "Review was added successfully!"
    else
      @star_collection = Review::STARS
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

  def authenticate_user
    if !user_signed_in?
      flash[:notice] = 'You must sign in or sign up.'
      redirect_to new_user_session_path
    end
  end
end
