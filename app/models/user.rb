class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  has_secure_password
  belongs_to :mom
  belongs_to :caregiver
end
