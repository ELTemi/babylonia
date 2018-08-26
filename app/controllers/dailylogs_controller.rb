class DailylogsController < ApplicationController


  def new
   @baby = Baby.find(params[:baby_id])
   @caregiver = @baby.caregiver
   @dailylog = Dailylog.new
  end

  def create
    @dailylog = Dailylog.create(dailylog_params)
    if @dailylog.save && current_user.admin == true
      @baby = @dailylog.baby
      @caregiver = @dailylog.caregiver
      redirect_to baby_dailylogs_path(@baby)
    else
      render :new
    end
  end

  def index
    if params[:baby_id]
      @baby = Baby.find(params[:baby_id])
      @dailylogs = @baby.dailylogs.order(:time_in)
    else
      @dailylogs = Dailylog.all.order(:time_in)
    end
  end

  def show
    @dailylog = Dailylog.find(params[:id])
  end

  def baby_logs
    baby = Baby.find(params[:id])
    render json: baby.dailylogs
  end

  def logs
    dailylogs = Dailylog.all.order(:time_in)
    render json: dailylogs
  end


  private

  def dailylog_params
    params.require(:dailylog).permit(:time_in, :nap, :meal, :diaper, :play_time, :summary, :meds, :time_out, :baby_id, :caregiver_id)
  end


end
