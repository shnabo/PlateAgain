class UsersController < ApplicationController

  before_action :ensure_logged_in, only: [:dashboard, :edit, :update, :destroy]

  def index
    redirect_to root_url
  end

  def providers
    @users = User.where('is_provider = ?', true)
  end

  def acceptors
    @users = User.where('is_provider = ?', false)
  end

  def show
    @user = load_user
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to dashboard_path, notice: "Registration successful!"
    else
      flash.now[:alert] = "Registration failed."
      render :new
    end
  end

  def edit
    @user = load_user
  end

  def update
    @user = load_user

    if @user.update_attributes(user_params)
      redirect_to dashboard_path, notice: "Profile updated!"
    else
      flash.now[:alert] = "Profile update failed."
      render :edit
    end
  end

  def dashboard
    @user = current_user
  end


  private

  def load_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :name, :email, :address, :phone, :description, :homepage, :photo, :registration, :password, :password_confirmation)
  end

end
