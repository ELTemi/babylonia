class DailylogsController < ApplicationController

  def new
   @dailylog = Dailylog.new
  end

  def create
    @dailylog = Dailylog.create(dailylog_params)
    if @dailylog.save
      @baby = @dailylog.baby
      redirect_to baby_dailylogs_path(@baby)
    else
      render :new
    end
  end

  def index
    @dailylogs = Dailylog.all
  end

  def show
    @dailylog = Dailylog.find(params[:id])
  end

  private

  def dailylog_params
    params.require(:dailylog).permit(:time_in, :nap, :meal, :diaper, :play_time, :summary, :meds, :time_out, :baby_id, :caregiver_id)
  end
end
