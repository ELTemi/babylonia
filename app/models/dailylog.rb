class Dailylog < ApplicationRecord
  belongs_to :baby
  belongs_to :caregiver
  validates_uniqueness_of :time_in, scope: :baby_id, message: "Log has already been created for this baby"

  def date_format
    time_in.strftime("%A, %B %dth, %Y")
  end
end
