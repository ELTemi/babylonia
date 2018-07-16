class Baby < ApplicationRecord
  belongs_to :mom
  belongs_to :care_giver
  has_many :daily_logs
end
