class UsersController < ApplicationController

  def new
   @user = User.create(user_params)
  end

  def create

  end

  private

  def user_params
    params.require(:user).permit(:user_name, :email, :password, :password_confirmation)
  end


end
