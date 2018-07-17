class CaregiversController < ApplicationController
  skip_before_action :require_login, only: [:home, :new, :create], raise: false

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
    @caregiver = Caregiver.find(params[:id])
    if session[:user_id] == @caregiver.id
      @caregiver.update(caregiver_params)
      redirect_to caregiver_path(@caregiver)
    else
      render :login
    end
  end

  def index
    @caregivers = Caregiver.all
  end

  def show
    @caregiver = Caregiver.find(params[:id])
    if session[:user_id] == @caregiver.id
      render :show
    else
      redirect_to '/login'
    end
  end

  def destroy
  end

  def caregiver_params
    params.require(:caregiver).permit(:name, :email, :picture, :phone_number, :rating, :age, :address, :availability, :password, :experience)
  end
end
