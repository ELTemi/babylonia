class BabiesController < ApplicationController

  def new
    @baby = Baby.new
    @mom = Mom.find(params[:mom_id])
  end

  def create
    @baby = Baby.create(baby_params)
    if @baby.save
      redirect_to mom_path(@baby.mom)
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
    redirect_to mom_path(@baby.mom)
  end

  #def index
  #  @babies = Baby.all
  #end

  #def show
  #  @baby = Baby.find(params[:id])
  #  @mom = @baby.mom
  #end

  def destroy
    if set_mom
      @baby = Baby.find(params[:id])
      @baby.destroy
      redirect_to mom_path(@baby.mom)
    end
  end


  def baby_params
    params.require(:baby).permit(:name, :sex, :dob, :picture, :allergies, :emergency_contact, :caregiver_id, :mom_id)
  end

  private

  def set_user
    current_user
  end

  def set_mom
    Mom.find_by(email: current_user.email)
  end
end
