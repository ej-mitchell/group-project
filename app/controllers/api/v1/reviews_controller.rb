class Api::V1::ReviewsController < ApplicationController
  def index
    render json: Review.all
  end

  def show
    render json: Review.where(book_id: params[:id])
  end
end
