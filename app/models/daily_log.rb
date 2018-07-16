class DailyLog < ApplicationRecord
  belongs_to :baby
  belongs_to :care_giver
end
