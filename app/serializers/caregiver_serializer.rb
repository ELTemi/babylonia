class CaregiverSerializer < ActiveModel::Serializer
  attributes :id
  has_many :babies
  has_many :dailylogs
end
