class SessionsController < ApplicationController
  def new
    @user = User.new
  end
  def create
    @user = User.new
   if @user.save
     redirect_to root_url
   else
     render :new
   end
end


def user_params
  params.require(:user).permit(:email, :password, :password_confirmation)
add sessions model, form
