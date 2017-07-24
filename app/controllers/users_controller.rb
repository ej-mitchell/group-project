class UsersController < ApplicationController
  before_action :authorize_user, only: [:index]
  def index
    @books = Book.all
  end

  private

  def authorize_user
    if !current_user.admin?
      raise ActionController::RoutingError.new("Not Found")
    end
  end
end
