class Baby < ApplicationRecord
  belongs_to :mom
  belongs_to :caregiver
  has_many :dailylogs
end
