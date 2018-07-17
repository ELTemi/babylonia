class MomsController < ApplicationController

  def new
    @mom = Mom.new
  end

  def create
    binding.pry
  end

  def edit
  end

  def update

  end

  def index
  end

  def show

  end

  def destroy
  end

  def mom_params
    params.require(:mom).permit(:name, :email, :picture, :phone_number, :pick_up_authorization, :password, :experience)
  end
end
