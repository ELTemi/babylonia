class Caregiver < ApplicationRecord
  has_many :babies
  has_many :moms, through: :babies
  has_many :dailylogs

  validates :name, presence: true, uniqueness: true
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :phone_number, uniqueness: true
  has_secure_password
  has_attached_file :avatar
  validates_attachment_file_name :avatar, :matches => [/png\Z/, /jpe?g\Z/, /gif\Z/]
  
end
