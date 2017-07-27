class VotesController < ApplicationController
  skip_before_action :verify_authenticity_token
  # before_action :authenticate_user!
  before_action :authenticate_user, only: [:create]

  # def new
  #   @vote = Vote.new
  #   @user = current_user
  #   @review = Review.find(params[:review_id])
  # end

  def create

    @vote = Vote.new(vote_params)
    @user = current_user

    @new_vote = Vote.find_by(user: @user, review_id: @vote.review_id)

    if @new_vote
      @new_vote.user = @user
      @new_vote.value = @vote.value
      @new_vote.save
      redirect_to books_path
    else
      @vote.user = @user
      @vote.save
      redirect_to books_path
    end

  end


  private

  def vote_params
    params.require(:vote).permit(:value, :review_id)
  end

  def authenticate_user
    if !user_signed_in?
      flash[:notice] = 'You must sign in or sign up.'
      redirect_to new_user_session_path
    end
  end

end
