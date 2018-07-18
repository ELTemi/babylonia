class BabiesController < ApplicationController
  def new
    @baby = Baby.new
    @mom = set_mom
  end

  def create
    @baby = Baby.create(baby_params)
    if @baby.save && current_user
      redirect_to baby_path(@baby)
    else
      render :new
    end
  end

  def edit

  end

  def update

  end

  def index
    @babies = Baby.all
  end

  def show
    @baby = Baby.find(params[:id])
    @mom = @baby.mom
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
