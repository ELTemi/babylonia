class CareGiver < ApplicationRecord
  has_many :babies
  has_many :moms, through: :babies
  has_many :daily_logs
  has_secure_password
end
