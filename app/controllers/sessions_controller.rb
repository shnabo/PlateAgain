class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to show_url, notice: "Logged In!"
   else
     render :new
   end
end


def user_params
  params.require(:user).permit(:email, :password, :password_confirmation)

end
end
