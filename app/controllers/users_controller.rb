# app/controllers/users_controller.rb
class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id]) # Fetch user by ID
  end
end
