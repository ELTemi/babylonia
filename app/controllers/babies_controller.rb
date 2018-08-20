class BabiesController < ApplicationController
  before_action :require_login
  skip_before_action :require_login, only: [:new, :create]

  def create
    @baby = Baby.create(baby_params)
    mom = Mom.new
    render json: @baby, status: 201
  end

  def edit
    @baby = Baby.find(params[:id])
  end

  def update
    @baby= Baby.find(params[:id])
    @baby.update(baby_params)
    redirect_to baby_path(@baby)
  end

  def index
    if mom_or_caregiver
      @babies = mom_or_caregiver.babies
      respond_to do |format|
        format.html {render :index}
        format.json {render json: @babies}
      end
    else
      @babies = Baby.all
    end
  end

  def show
    @baby = Baby.find(params[:id])
    if check_mom
      render :show
    else
      flash[:notice] = "You cant view another person's baby!"
      @babies = Baby.all
      render :index
    end
  end

  def nextBaby
    baby = Baby.find(params[:id])
    render json: baby
  end


  private

  def baby_params
    params.require(:baby).permit(:name, :sex, :dob, :avatar, :allergies, :emergency_contact, :caregiver_id, :mom_id)
  end

  def check_mom
    (@baby.mom.email ==  current_user.email) || (@baby.caregiver.email == current_user.email)
  end

  def mom_or_caregiver
    Mom.find_by(email: current_user.email) || Caregiver.find_by(email: current_user.email)
  end


end
