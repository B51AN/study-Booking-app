class HomeController < ApplicationController
  before_action :authenticate_user! # This will require authentication for all actions in the controller

  def index
  end
end
