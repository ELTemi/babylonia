class Caregiver < ApplicationRecord
  has_many :moms, through: :babies
  has_many :dailylogs
  has_many :babies, through: :dailylogs

  validates :name, uniqueness: true
  validates :name, presence: true
  validates :email, uniqueness: true
  validates :email, presence: true
  validates :phone_number, uniqueness: true
  has_secure_password
end
