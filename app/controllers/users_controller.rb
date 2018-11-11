class UsersController < ApplicationController
  before_action :find_user
  before_action :logged_in_user, only: [:index, :edit, :update]
  before_action :correct_user,  only: [:edit, :update]

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.valid?
      log_in @user
      flash[:success] = "Welcome welcome welcome"
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
      if @user.update_attributes(user_params)
        # Handle a successful update.
        flash[:success] = "Profile updated"
        redirect_to @user
      else
        render 'edit'
      end
    end

  private

  def user_params
    params.require(:user).permit(:user_name, :email, :password, :password_confirmation)
  end

  def find_user
    @user = User.find_by(id: params[:id])
    #code
  end

  # Before filters

  # Confirms a logged-in user.
  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end

    # Confirms the correct user.
  def correct_user
    find_user
    redirect_to(root_url) unless current_user?(@user)
  end

end  # /> class
