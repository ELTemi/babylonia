class SessionsController < ApplicationController

  def home
  end


  def login
    @user = User.new
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
      flash[:notice] = "Invalid email and/or password combination!"
      render :login
    end
  end


  def facebook_create
    @user = User.find_or_create_by(email: auth[:info][:email]) do |u|
      u.name = auth[:info][:name]
      u.email = auth[:info][:email]
      u.avatar = auth[:info][:image]
    end
    @caregiver = Caregiver.find_by(email: @user.email)
    @mom = Mom.find_by(email: @user.email)
    if !@caregiver.blank?
      session[:user_id] = @user.id
      redirect_to caregiver_path(@caregiver)
    elsif !@mom.blank?
      session[:user_id] = @user.id
      redirect_to mom_path(@mom)
    else
      render :home
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

  def auth
    request.env['omniauth.auth']
  end


end
