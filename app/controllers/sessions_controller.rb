class SessionsController < ApplicationController

  def home
  end


  def login
    @user = User.new
    if session[:user_id].blank? == false
      redirect_to dailylogs_path
    else
      render :login
    end
  end

  def create
    @caregiver = Caregiver.find_by(email: params[:user][:email])
    @mom = Mom.find_by(email: params[:user][:email])
    @user = User.find_by(email: params[:user][:email])
    if !@caregiver.blank? && @caregiver.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to caregiver_path(@caregiver)
    elsif !@mom.blank? && @mom.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to mom_path(@mom)
    else
      render :login
    end
  end

  def logout
    session.delete :user_id
    redirect_to root_url
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :admin)
  end

  def require_login
    return head(:forbidden) unless session.include? :user_id
  end

end
