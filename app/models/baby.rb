class Baby < ApplicationRecord
  belongs_to :mom
  belongs_to :caregiver
  has_many :dailylogs
  has_attached_file :avatar
  validates_uniqueness_of :name, scope: :mom_id, message: "This baby has already been added, check name"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

end
