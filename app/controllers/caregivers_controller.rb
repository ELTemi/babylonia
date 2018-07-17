class CaregiversController < ApplicationController

  def home

  end

  def new
    @caregiver = Caregiver.new
  end

  def create
    @caregiver = Caregiver.create(caregiver_params)
    if @caregiver.save
      session[:user_id] = @caregiver.id
      redirect_to caregiver_path(@caregiver)
    else
      render :new
    end
  end

  def edit
    @caregiver = Caregiver.find(params[:id])
  end

  def update

  end

  def index
    @caregivers = Caregiver.all
  end

  def show
    @caregiver = Caregiver.find(params[:id])
    if current_user(Caregiver)
      render :show
    else
      redirect_to '/'
    end
  end

  def destroy
  end

  def caregiver_params
    params.require(:caregiver).permit(:name, :email, :picture, :phone_number, :rating, :age, :address, :availability, :password, :experience)
  end
end
