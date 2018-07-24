class DailylogsController < ApplicationController


  def new
   @dailylog = Dailylog.new
  end

  def create
    @dailylog = Dailylog.create(dailylog_params)
    if @dailylog.save && current_user.admin == true
      @baby = @dailylog.baby
      redirect_to baby_dailylogs_path(@baby)
    else
      render :new
    end
  end

  def index
    if params[:baby_id]
      @baby = Baby.find(params[:baby_id])
      @dailylogs = @baby.dailylogs
    else
      @dailylogs = Dailylog.all
    end
  end

  def show
    @dailylog = Dailylog.find(params[:id])
  end

  private

  def dailylog_params
    params.require(:dailylog).permit(:time_in, :nap, :meal, :diaper, :play_time, :summary, :meds, :time_out, :baby_id, :caregiver_id)
  end


end
