class UsersController < ApplicationController
  def index
  end

  def new
  end

  def show
  end



  private

  def user_params
  	params.require(:user).permit(:username, :password)
  end
end
