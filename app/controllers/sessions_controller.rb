class SessionsController < ApplicationController
  def new
  end

  def create
    if login(params[:email], params[:password])
      redirect_back_or_to dashboard_path, notice: 'Login successful'
    else
      flash.now[:alert] = 'Login failed'
      render action: 'new'
    end
  end

  def destroy
    logout
    redirect_to root_url, notice: 'Logged out!'
  end

end
