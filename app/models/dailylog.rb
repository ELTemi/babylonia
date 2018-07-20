class Dailylog < ApplicationRecord
  belongs_to :baby
  belongs_to :caregiver

  def date_format
    time_in.strftime("%A, %B %dth, %Y")
  end
end
