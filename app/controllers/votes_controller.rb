class VotesController < ApplicationController
  before_action :authenticate_user, only: [:new, :create]
  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  private

  def authenticate_user
    if !user_signed_in?
      flash[:notice] = 'You must sign in or sign up.'
      redirect_to new_user_session_path
    end
  end

end
