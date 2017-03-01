class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)

      if @user.save
        redirect_to user_show_url
      else
        render :new
      end
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(user_params)
      redirect_to user_show_url(@user)

    else
      render :edit
    end

    def providers
      if @users = users.where()
    end
    def acceptors
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :address, :phone, :description, :homepage, :photo, :registration, :created_at, :updated_at)
  end
end
