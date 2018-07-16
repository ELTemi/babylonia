class Mom < ApplicationRecord
  has_many :babies
  has_many :caregivers, through: :babies
  has_secure_password
end
