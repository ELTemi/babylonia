class SessionsController < ApplicationController

  def login
    @user = User.new
  end

  def create
    if params[:user][:admin] == "1"
      @caregiver = Caregiver.find_by(email: params[:user][:email])
      session[:user_id] = @caregiver.id
      redirect_to caregiver_path(@caregiver)
    else
      @mom = Mom.find_by(email: params[:user][:email])
      session[:user_id] = @mom.id
      redirect_to mom_path(@mom)
    end
  end

  def logout

  end
end
