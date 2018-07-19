class DailylogsController < ApplicationController
  before_action :require_login
  skip_before_action :require_login, only: [:index]

  def new
   @baby = Baby.find(params[:baby_id])
   @dailylog = Dailylog.new
  end

  def create
    @baby = Baby.find(params[:baby_id])
    @dailylog = Dailylog.create(dailylog_params)
    if @dailylog.save
      @dailylog.baby = @baby.id
    end
  end

  def edit

  end

  def update

  end

  def index
    @dailylogs = Dailylog.all
  end

  def show
    @dailylog = Dailylog.find(params[:id])
  end

  def destroy
  end

  private

  def dailylog_params
    params.require(:dailylog).permit(:time_in, :nap, :meal, :diaper, :play_time, :summary, :meds, :time_out, :baby_id, :caregiver_id)
  end
end
