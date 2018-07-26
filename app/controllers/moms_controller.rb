class MomsController < ApplicationController
  before_action :require_login
  skip_before_action :require_login, only: [:index, :new, :create]
  #layout "moms", except: [:new, :edit]


  def index
    if logged_in?
      @moms= Mom.all
    else
      require_login
    end
  end

  def new
    @mom = Mom.new
  end

  def create
    @mom = Mom.create(mom_params)
    if @mom.save
      @user = User.create(email: @mom.email, password: @mom.password, admin: false)
      session[:user_id] = @user.id
      redirect_to mom_path(@mom)
    else
      render :new
    end
  end

  def edit
    @mom = Mom.find(params[:id])
  end

  def update
    @mom = Mom.find(params[:id])
    if current_user.email = @mom.email
      @mom.update(mom_params)
      redirect_to mom_path(@mom)
    else
      render :login
    end
  end

  def show
    @mom = Mom.find(params[:id])
    if !@mom.blank? && @mom.email == current_user.email
      render :show
    else
      @moms = Mom.all
      flash[:notice] = "You cant view another person's account!"
      render :index
    end
  end


  def destroy
  end


  private

  def mom_params
    params.require(:mom).permit(:name, :email, :avatar, :phone_number, :pick_up_authorization, :password, :experience, :caregiver_ids => [])
  end


  def logged_in_as_caregiver?
    logged_in? && current_user.admin == true
  end


end
