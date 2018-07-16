class Caregiver < ApplicationRecord
  has_many :babies
  has_many :moms, through: :babies
  has_many :dailylogs
  has_secure_password
end
