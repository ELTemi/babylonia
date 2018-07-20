class BabiesController < ApplicationController

  def new
    @baby = Baby.new
    if current_user.admin == true
      redirect_to root_url
    else
      render :new
    end
  end

  def create
    @baby = Baby.create(baby_params)
    @baby.mom = Mom.find_by(email: current_user.email)
    if @baby.save
      redirect_to baby_path(@baby)
    else
      render :new
    end
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
  end

  def destroy
    @baby = Baby.find_by(params[:id])
    @baby.destroy
    redirect_to babies_path
  end


  private

  def baby_params
    params.require(:baby).permit(:name, :sex, :dob, :avatar, :allergies, :emergency_contact, :caregiver_id, :mom_id)
  end


end
