class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    current_user ||= session[:user_id] &&
      User.find_by(id: session[:user_id])
  end

  private
  def require_login
    unless current_user
      flash[:error] = "You must be logged in to access this page"
      redirect_to '/login'
    end
  end
end
