class Baby < ApplicationRecord
  belongs_to :mom
  has_many :dailylogs
  has_many :caregivers, through: :dailylogs
end
