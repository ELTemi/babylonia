class MomsController < ApplicationController
  before_action :require_login
  skip_before_action :require_login, only: [:index, :new, :create]
  layout  "moms"

  def index
    @mom = Mom.find_by(email: current_user.email)
    @moms= Mom.all
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
    @mom = Mom.find(params[:id])
  end

  def update
    @mom = Mom.find(params[:id])
    if current_user.email = @mom.email
      @mom.update(mom_params)
      redirect_to mom_path(@mom)
    else
      render :login
    end
  end

  def show
    @mom = Mom.find(params[:id])
    if access_mom
      render :show
    else
      @moms = Mom.all
      flash[:notice] = "You cant view another person's account!"
      render :index
    end
  end


  def destroy
  end


  private

  def mom_params
    params.require(:mom).permit(:name, :email, :avatar, :phone_number, :pick_up_authorization, :password, :experience, :caregiver_ids => [])
  end

  def access_mom
    current_user.admin? || @mom.email == current_user.email
  end


end
