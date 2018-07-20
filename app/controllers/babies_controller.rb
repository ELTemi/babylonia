class BabiesController < ApplicationController

  def new
    @baby = Baby.new
  end

  def create
    @baby = Baby.create(baby_params)
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
    redirect_to mom_path(@baby.mom)
  end

  def index
    @babies = Baby.all
  end

  def show
    @baby = Baby.find(params[:id])
  end

  def destroy
    @baby = Baby.find(params[:id])
    @baby.destroy
    redirect_to mom_path(@baby.mom)
  end

  private

  def baby_params
    params.require(:baby).permit(:name, :sex, :dob, :picture, :allergies, :emergency_contact, :caregiver_id, :mom_id)
  end
end
