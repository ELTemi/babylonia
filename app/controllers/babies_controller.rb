class BabiesController < ApplicationController
  before_action :require_login
  skip_before_action :require_login, only: [:new, :create]

  def create
    @baby = Baby.create(baby_params)
    mom = Mom.new
    redirect_to @baby.mom
  end

  def edit
    @baby = Baby.find(params[:id])
  end

  def update
    @baby= Baby.find(params[:id])
    @baby.update(baby_params)
    redirect_to baby_path(@baby)
  end

  def index
    @babies = Baby.all
  end

  def show
    @baby = Baby.find(params[:id])
    if check_mom
      render :show
    else
      flash[:notice] = "You cant view another person's baby!"
      @babies = Baby.all
      render :index
    end
  end

  def destroy
    @baby = Baby.find_by(params[:id])
    @baby.destroy
    flash[:notice] = "Baby Profile deleted"
    redirect_to babies_path
  end


  private

  def baby_params
    params.require(:baby).permit(:name, :sex, :dob, :avatar, :allergies, :emergency_contact, :caregiver_id, :mom_id)
  end

  def check_mom
      (@baby.mom.email ==  current_user.email) || (@baby.caregiver.email == current_user.email)
  end


end
