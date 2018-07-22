class CaregiversController < ApplicationController
  before_action :require_login
  skip_before_action :require_login, only: [:new, :create]

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
    @caregiver = Caregiver.find(params[:id])
  end

  def update
    @caregiver = Caregiver.find(params[:id])
    @caregiver.update(caregiver_params)
    redirect_to caregiver_path(@caregiver)
  end

  def index
    if !params[:experience].blank? && params[:experience] == "5 years - 10 years"
      @caregivers = Caregiver.medium_experienced
    elsif !params[:experience].blank? && params[:experience] == " < 5 years"
      @caregivers = Caregiver.least_experienced
    elsif !params[:experience].blank? && params[:experience] == " > 10 years"
      @caregivers = Caregiver.most_experienced
    else
      @caregivers = Caregiver.all
    end
  end

  def show
    @caregiver = Caregiver.find(params[:id])
  end


  private

  def caregiver_params
    params.require(:caregiver).permit(:name, :email, :avatar, :phone_number, :rating, :age, :address, :availability, :password, :experience, :baby_ids => [])
  end

  def auth
    request.env['omniauth.auth']
  end


end
