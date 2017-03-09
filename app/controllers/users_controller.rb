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

  def listings
    load_user
    @listings = @user.listings
  end

  def show
    @user = load_user
    if current_user
    @current_address = current_user.add_number + '+' + current_user.add_name + '+' + current_user.add_type + '+' + current_user.your_city + '+' + current_user.postal
    @address = @user.add_number + '+' + @user.add_name + '+' + @user.add_type + '+' + @user.your_city + '+' + @user.postal

    else
    @address = @user.add_number + '+' + @user.add_name + '+' + @user.add_type + '+' + @user.your_city + '+' + @user.postal
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      UserMailer.signup_confirmation(@user).deliver
      auto_login(@user)
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
    @listings = @user.listings
  end


  private

  def load_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :name, :email, :is_provider, :full_street_address, :phone, :description, :homepage, :photo, :registration, :password, :password_confirmation, :add_number, :add_name, :add_type, :your_city, :postal)
  end

end
