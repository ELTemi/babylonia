class CaregiversController < ApplicationController

  def home
  end

  def new
    @caregiver = Caregiver.new
  end

  def create
    @caregiver = Caregiver.create(caregiver_params)
    if @caregiver.save
      @user = User.create(email: @caregiver.email, password: @caregiver.password, admin: true)
      session[:user_id] = @user.id
      redirect_to caregiver_path(@caregiver)
    else
      render :new
    end
  end

  def edit
    if current_user
      @caregiver = Caregiver.find(params[:id])
    else
      redirect_to '/login'
    end
  end

  def update
    @caregiver = Caregiver.find(params[:id])
    current_user
    if current_user
      @caregiver.update(caregiver_params)
      redirect_to caregiver_path(@caregiver)
    else
      render :login
    end
  end

  def index
    if current_user
      @caregivers = Caregiver.all
    else
      redirect_to '/login'
    end
  end

  def show
    @caregiver = Caregiver.find(params[:id])
    if current_user
      render :show
    else
      redirect_to '/login'
    end
  end


  def caregiver_params
    params.require(:caregiver).permit(:name, :email, :picture, :phone_number, :rating, :age, :address, :availability, :password, :experience, :baby_ids => [])
  end
end
