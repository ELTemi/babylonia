class MomsController < ApplicationController

  def new
    @mom = Mom.new
  end

  def create
    @mom = Mom.create(mom_params)
    if @mom.save
      @user = User.create(email: @mom.email, password: @mom.password)
      session[:user_id] = @user.id
      redirect_to mom_path(@mom)
    else
      render :new
    end
  end

  def edit
    if current_user
      @mom = Mom.find(params[:id])
    end
  end

  def update
    @mom = Mom.find(params[:id])
    current_user
    if current_user
      @mom.update(mom_params)
      redirect_to mom_path(@mom)
    else
      render :login
    end
  end

  def show
    @mom = Mom.find(params[:id])
    if current_user
      render :show
    else
      redirect_to '/login'
    end
  end

  def destroy
  end

  def mom_params
    params.require(:mom).permit(:name, :email, :picture, :phone_number, :pick_up_authorization, :password, :experience)
  end
end
