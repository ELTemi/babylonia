class BabiesController < ApplicationController
  def new
    @baby = Baby.new
    @mom = set_mom
  end

  def create
    @baby = Baby.create(baby_params)
    binding.pry
    if @baby.save && set_mom
      redirect_to mom_path(@baby.mom)
    else
      render :new
    end
  end

  def edit
    if current_user
      @baby = Baby.find(params[:id])
      @mom = set_mom
    end
  end

  def update
    @baby= Baby.find(params[:id])
    current_user
    if set_mom
      @baby.update(baby_params)
      redirect_to mom_path(@baby.mom)
    else
      render :login
    end
  end

  def index
    @babies = Baby.all
  end

  def show
    @baby = Baby.find(params[:id])
    @mom = @baby.mom
  end

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
