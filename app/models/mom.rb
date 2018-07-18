class Mom < ApplicationRecord
  has_many :babies
  has_many :caregivers, through: :babies
  validates :name, uniqueness: true
  validates :name, presence: true
  validates :email, uniqueness: true
  validates :email, presence: true
  has_secure_password


end
