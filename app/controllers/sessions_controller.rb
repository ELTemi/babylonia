class SessionsController < ApplicationController

  def login
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if params[:user][:admin] == "1"
      @caregiver = Caregiver.find_by(email: params[:user][:email])
      if @caregiver.authenticate(params[:user][:password])
        session[:user_id] = @user_id
        redirect_to caregiver_path(@caregiver)
      else
        render :login
      end
    else
      @mom = Mom.find_by(email: params[:user][:email])
      if @mom.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        redirect_to mom_path(@mom)
      else
        render :login
      end
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


end
