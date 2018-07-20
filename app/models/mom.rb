class Mom < ApplicationRecord
  has_many :babies
  has_many :caregivers, through: :babies
  
  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  has_secure_password
  has_attached_file :avatar
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

end
