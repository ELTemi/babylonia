class CaregiversController < ApplicationController

  def new
    @caregiver = Caregiver.new
  end

  def create
    caregiver = Caregiver.create(caregiver_params)
  end

  def edit

  end

  def update

  end

  def index
    @caregivers = Caregiver.all
  end

  def show
  end

  def destroy
  end

  def caregiver_params
    params.require(:caregiver).permit(:name, :email, :picture, :phone_number, :rating, :age, :address, :availability, :password, :experience)
  end
end
