class Dailylog < ApplicationRecord
  belongs_to :baby
  belongs_to :caregiver
  validates_uniqueness_of :time_in, scope: :baby_id, message: "Log has already been created for this baby"

  def date_format_for_time_in
    time_in.strftime("%A, %B %dth, %Y")
  end

  def date_format_for_time_out
    time_out.strftime("%A, %B %dth, %Y")
  end

  def time_in_format
    time_in.strftime("%r")
  end

  def time_out_format
    time_out.strftime("%r")
  end
end
