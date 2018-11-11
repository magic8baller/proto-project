class UsersController < ApplicationController
  before_action :find_user

  def new
@user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.valid?
      log_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end


    def index
      @users = User.all
    end

    def show
      #code
    end

    def edit
      #code
    end

    def update
      #code
    end

  private

  def user_params
    params.require(:user).permit(:user_name, :email, :password, :password_confirmation)
  end

  def find_user
    @user = User.find_by(id: params[:id])
    #code
  end


end
