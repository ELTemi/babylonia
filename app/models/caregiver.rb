class Caregiver < ApplicationRecord
  has_many :babies
  has_many :moms, through: :babies
  has_many :dailylogs

  validates :name, presence: true, uniqueness: true
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :phone_number, uniqueness: true, length: { is: 10 }
  has_secure_password
  has_attached_file :avatar
  validates_attachment_file_name :avatar, :matches => [/png\Z/, /jpe?g\Z/, /gif\Z/]


  def self.most_experienced
    where("experience > ?", 10)
  end

  def self.least_experienced
    where("experience <= ?", 5)
  end

  def self.medium_experienced
    where("experience > 5 AND experience <= 10")
  end
end
