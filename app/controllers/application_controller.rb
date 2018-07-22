class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception


  def current_user
    current_user ||= session[:user_id] &&
      User.find_by(id: session[:user_id])
  end

  private
  def require_login
    flash[:notice] = "Please log in to Continue"
    redirect_to login_path unless session.include? :user_id
  end
end
