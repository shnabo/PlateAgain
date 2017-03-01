class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def ensure_logged_in
    unless current_user
      flash[:alert] = "Please log in"
      redirect_to users_url
    end
  end
end
