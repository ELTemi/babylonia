class ApplicationController < ActionController::Base

  def current_user(name)
    current_user ||= session[:user_id] &&
      name.find_by(id: session[:user_id])
  end
end
