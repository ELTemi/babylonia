class BabySerializer < ActiveModel::Serializer
  attributes :id, :name, :sex, :dob, :avatar, :allergies, :emergency_contact
  belongs_to :mom
  belongs_to :caregiver
  has_many :dailylogs
end
