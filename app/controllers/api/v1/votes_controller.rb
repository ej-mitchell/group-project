class Api::V1::VotesController < ApplicationController
  def index
    render json: Vote.all
  end


  private

  def vote_params
    params.require(:vote).permit(:value, :review_id)
  end

end
