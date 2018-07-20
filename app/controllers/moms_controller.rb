class MomsController < ApplicationController
  before_action :require_login
  skip_before_action :require_login, only: [:index, :new, :create]

  def index
    @moms= Mom.all
  end

  def show
    @mom = Mom.find(params[:id])
  end

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


  def destroy
  end


  private

  def mom_params
    params.require(:mom).permit(:name, :email, :avatar, :phone_number, :pick_up_authorization, :password, :experience, :caregiver_ids => [])
  end

end
