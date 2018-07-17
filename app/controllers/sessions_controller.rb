class SessionsController < ApplicationController

  def login
    @user = User.new
  end

  def create
    if params[:user][:admin] == "1"
      @caregiver = Caregiver.find_by(email: params[:user][:email])
      if @caregiver.authenticate(params[:user][:password])
        session[:user_id] = @caregiver.id
        redirect_to caregiver_path(@caregiver)
      else
        render :login
      end
    else
      @mom = Mom.find_by(email: params[:user][:email])
      if @mom.authenticate(params[:user][:password])
        session[:user_id] = @mom.id
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
end
