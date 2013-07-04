class UsersController < ApplicationController
  def index
  	@users = User.all
  	@message = "Message Test"
  end

  def new
  end
end
